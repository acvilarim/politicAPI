# http://legis.senado.gov.br/dadosabertos/senador/lista/atual

require 'mechanize'
require 'xmlsimple'

namespace :cw_senado do

  desc "base_info"
  task base_info: :environment do
    agent = Mechanize.new

    agent.get('http://legis.senado.gov.br/dadosabertos/senador/lista/atual')

    xml = agent.current_page.body
    status = XmlSimple.xml_in(xml)

    status['Parlamentares'][0]['Parlamentar'].each do |parlamentar|

      pol = Politico.new 
      pol.nome = Politico.clean_content parlamentar['NomeCompleto']
      pol.sexo = Politico.clean_content parlamentar['Sexo']
      pol.email = Politico.clean_content parlamentar['EnderecoEletronico']
      pol.data_nascimento = Politico.clean_content parlamentar['DataNascimento']
      pol.uf_nascimento = Politico.clean_content parlamentar['SiglaUfNatural']
      pol.foto = Politico.clean_content parlamentar['Foto']
      pol.contato = {
        endereco: Politico.clean_content(parlamentar['EnderecoParlamentar']),
        telefone: Politico.clean_content(parlamentar['TelefoneParlamentar'])
      }

      pol.save

      man = Mandato.new
      man.politico = pol
      man.tipo = 'senador'
      man.ano = Politico.get_ano parlamentar['MandatoAtual']
      man.codigo = Politico.clean_content parlamentar['CodigoParlamentar']
      man.partido = Politico.clean_content parlamentar['SiglaPartido']
      man.uf = Politico.clean_content parlamentar['SiglaUf']
      man.nome_parlamentar = Politico.clean_content parlamentar['NomeParlamentar']

      man.save

      puts man.inspect



      # agent.get('http://www.senado.gov.br/senadores/dinamico/paginst/senador' + parlamentar['CodigoParlamentar'][0] + 'a.asp')
      # doc = Nokogiri::HTML(agent.current_page.body)
      # puts doc.search('.dadosSenador').search('b').inspect
    end
  end
end

# rails g model Politico nome:string sexo:string foto:string email:string data_nascimento:date uf_nascimento:string midia_social:string contato:string
# rails g model Mandato tipo:string partido:string uf:string nome_parlamentar:string ano:integer codigo:string