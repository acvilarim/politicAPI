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
      pol.nome = parlamentar['NomeCompleto'][0]
      pol.sexo = parlamentar['NomeCompleto'][0]
      pol.email = parlamentar['NomeCompleto'][0]
      pol.data_nascimento = parlamentar['NomeCompleto'][0]
      pol.uf_nascimento = parlamentar['NomeCompleto'][0]
      pol.foto = parlamentar['NomeCompleto'][0]


      # pol.contato =

      # pol.save

      puts pol.inspect



      # agent.get('http://www.senado.gov.br/senadores/dinamico/paginst/senador' + parlamentar['CodigoParlamentar'][0] + 'a.asp')
      # doc = Nokogiri::HTML(agent.current_page.body)
      # puts doc.search('.dadosSenador').search('b').inspect
    end
  end
end

# rails g model Politico nome:string sexo:string foto:string email:string data_nascimento:date uf_nascimento:string midia_social:string contato:string
