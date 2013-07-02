require 'mechanize'
require 'xmlsimple'

desc "Import from Camera"
task :get_deputados => :environment do
  CAMERA_LINK = "http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados"
  IMAGE_BASE_LINK = "http://www.camara.gov.br/internet/deputado/bandep/"

  agent = Mechanize.new
  agent.get(CAMERA_LINK)

  xml = agent.page.body
    list = XmlSimple.xml_in(xml)

    list['deputado'].each do |dep|
      pol = Politico.new 
    pol.nome = clean_content dep['nome']
    pol.sexo = clean_content dep['sexo']
    pol.email = clean_content dep['email']    
    pol.uf_nascimento = clean_content dep['uf']
    pol.foto = dep_image_url(clean_content dep['ideCadastro'])    
    pol.save!
    end
end

desc "Import from Senado"
task get_senadores: :environment do
  agent = Mechanize.new
  agent.get('http://legis.senado.gov.br/dadosabertos/senador/lista/atual')

  xml = agent.current_page.body
  status = XmlSimple.xml_in(xml)

  status['Parlamentares'][0]['Parlamentar'].each do |parlamentar|

    pol = Politico.new 
    pol.nome = clean_content parlamentar['NomeCompleto']
    pol.sexo = clean_content parlamentar['Sexo']
    pol.email = clean_content parlamentar['EnderecoEletronico']
    pol.data_nascimento = clean_content parlamentar['DataNascimento']
    pol.uf_nascimento = clean_content parlamentar['SiglaUfNatural']
    pol.foto = clean_content parlamentar['Foto']
    pol.contato = {
      endereco: clean_content(parlamentar['EnderecoParlamentar']),
      telefone: clean_content(parlamentar['TelefoneParlamentar'])
    }

    pol.save!
  end
end

desc "Import Orgaos"
task :get_orgaos => :environment do
  agent = Mechanize.new
  agent.get("http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterOrgaos")

  xml = agent.page.body
  list = XmlSimple.xml_in(xml)
  
  list["orgao"].each do |param|
      codigo = Orgao.clean param["id"]
      sigla = Orgao.clean param['sigla']
      descricao = Orgao.clean param['descricao']
      Orgao.find_or_create_by_codigo(codigo).update_attributes(:sigla => sigla, :descricao => descricao)
    end
end

def dep_image_url (id_de_cadastro)
	(IMAGE_BASE_LINK + id_de_cadastro + ".jpg")
end

def clean_content (content)
	content.nil? ? '' : content[0]
end