desc "Import from Camera"
task :get_deputados => :environment do
	require 'mechanize'

	agent = Mechanize.new
	agent.get("http://www2.camara.leg.br/deputados/pesquisa")

	deputados_form = agent.page.parser.css('form[name=form1]').first
	deputados = deputados_form.css('option')[1 .. -1]
	puts deputados.inspect

	current_dep = deputados.last["value"]
	deputados_form['deputado'] = current_dep
	deputados_form['rbDeputado'] = "IC"
	deputados_form['Pesquisa'] = "Pesquisar"


	deputados_form.submit

	#agent.get('http://www2.camara.leg.br/layouts_deputados_pesqLegAtualDepExerc?leg=54&deputado=ZOINHO%7C530138%2523328%21RJ%3DPR%3F160625&DepID=&DepMat=&DepUF=&DepPart=&rbDeputado=IC&Pesquisa=Pesquisar')

end

http://www2.camara.leg.br/layouts_deputados_pesqLegAtualDepExerc?deputado=ZOINHO%7C530138%2523328%21RJ%3DPR%3F160625&DepID=&DepMat=&DepUF=&DepPart=&rbDeputado=IC&Pesquisa=Pesquisar


#http://www2.camara.leg.br/layouts_deputados_pesqLegAtualDepExerc?leg=54&deputado=ZOINHO%7C530138%2523328%21RJ%3DPR%3F160625&DepID=&DepMat=&DepUF=&DepPart=&rbDeputado=IC&Pesquisa=Pesquisar
