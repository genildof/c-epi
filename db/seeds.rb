# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

factories = Fabrica.create([{nome: 'CAMPINAS', estado: 'SP'},
                            {nome: 'GUARULHOS', estado: 'SP'},
                            {nome: 'ABC', estado: 'SP'},
                            {nome: 'RIBEIRÃO', estado: 'SP'},
                            {nome: 'SÃO PAULO', estado: 'SP'}])

cidades = Cidade.create ([{nome: 'CAMPINAS', fabrica: factories.first},
                          {nome: 'INDAIATUBA', fabrica: factories.first},
                          {nome: 'SOROCABA', fabrica: factories.first},
                          {nome: 'VOTORANTIM', fabrica: factories.first},
                          {nome: 'PIRACICABA', fabrica: factories.first},
                          {nome: 'JUNDIAÍ', fabrica: factories.first},
                          {nome: 'VÁRZEA PAULISTA', fabrica: factories.first}])

positions = Cargo.create([{nome: 'INSTALADOR LA', periculosidade: 'SIM'},
                          {nome: 'REPARADOR LA', periculosidade: 'SIM'},
                          {nome: 'AUXILIAR LA', periculosidade: 'NAO'},
                          {nome: 'AUXILIAR TÉCNICO', periculosidade: 'NAO'},
                          {nome: 'SUPERVISOR INSTALAÇÃO', periculosidade: 'SIM'},
                          {nome: 'SUPERVISOR REPARO', periculosidade: 'SIM'},
                          {nome: 'SUPERVISOR REDES', periculosidade: 'NAO'},
                          {nome: 'TÉCNICO TELECOM', periculosidade: 'NAO'}])

Material.create([{codigo: '900111', tipo: 'FERRAMENTAL', nome: 'ESCADA 9 METROS'},
                 {codigo: '900121', tipo: 'EPI', nome: 'TALABARTE'},
                 {codigo: '900131', tipo: 'FERRAMENTAL', nome: 'CONE SINALIZAÇÃO'},
                 {codigo: '900141', tipo: 'EPI', nome: 'OCULOS UV'},
                 {codigo: '900151', tipo: 'EPI', nome: 'CAPACETE'},
                 {codigo: '900151', tipo: 'EPI', nome: 'PROTETOR AURICULAR'},
                 {codigo: '900161', tipo: 'EPI', nome: 'BOTINA'},
                 {codigo: '900171', tipo: 'EPI', nome: 'CAPA DE CHUVA'}])

User.create([{name: 'MARCIO TORRES GUEDES', username: 'g0038389', password: 'gvt25', profile: 'OPERATOR', cidade: cidades.first},
             {name: 'NELSON POLLETO', username: 'g0011389', password: 'gvt25', profile: 'ADVANCED', cidade: cidades.first},
             {name: 'GENILDO FERREIRA', username: 'g0001959', password: 'genildof', profile: 'ADMIN', cidade: cidades.first}])

Colaborador.create ([{matricula: '11320', nome: 'ANDERSON SILVA', cargo: positions.first, cidade: cidades.first, admissao: Time.now - 6.month},
                     {matricula: '11320', nome: 'NILTON CARLOS DE PÁDUA', cargo: positions.first, cidade: cidades.first, admissao: Time.now - 1.year},
                     {matricula: '11320', nome: 'PAULO MATHEUS ROMERO', cargo: positions.first, cidade: cidades.first, admissao: Time.now - 2.year}])

