desc "Import from Camera"
task :get_deputados => :environment do
	require 'mechanize'

	agent = Mechanize.new
	agent.get("http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados")

	xml = agent.page.body
    list = XmlSimple.xml_in(xml)

    list['deputado'].each do |dep|
    	puts dep['nome']
    end

	#agent.get('http://www2.camara.leg.br/layouts_deputados_pesqLegAtualDepExerc?leg=54&deputado=ZOINHO%7C530138%2523328%21RJ%3DPR%3F160625&DepID=&DepMat=&DepUF=&DepPart=&rbDeputado=IC&Pesquisa=Pesquisar')

end

# http://www2.camara.leg.br/layouts_deputados_pesqLegAtualDepExerc?deputado=ZOINHO%7C530138%2523328%21RJ%3DPR%3F160625&DepID=&DepMat=&DepUF=&DepPart=&rbDeputado=IC&Pesquisa=Pesquisar


#http://www2.camara.leg.br/layouts_deputados_pesqLegAtualDepExerc?leg=54&deputado=ZOINHO%7C530138%2523328%21RJ%3DPR%3F160625&DepID=&DepMat=&DepUF=&DepPart=&rbDeputado=IC&Pesquisa=Pesquisar
