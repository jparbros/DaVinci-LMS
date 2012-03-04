# encoding: utf-8

Course.create(full_name: 'Metodología y tecnología de la programación I', abbreviation: 'MTP')
Course.create(full_name: 'Fundamentos matemáticos de la informática I', abbreviation: 'FMI1')
Course.create(full_name: 'Fundamentos de sistemas de información', abbreviation: 'FSI')
Course.create(full_name: 'Técnicas de organización y gestión empresarial I', abbreviation: 'TOG1')
Course.create(full_name: 'Estructura y tecnología de computadores', abbreviation: 'ETC')
Course.create(full_name: 'Estructura de datos y de la información', abbreviation: 'EDI')

Course.create(full_name: 'Sistemas integrados de gestión I', abbreviation: 'SIG1')
Course.create(full_name: 'Bases de datos', abbreviation: 'BD')
Course.create(full_name: 'Estadística', abbreviation: 'EST')
Course.create(full_name: 'Técnicas de organización y gestión empresarial II', abbreviation: 'TOG2')
Course.create(full_name: 'Fundamentos matemáticos de la informática II', abbreviation: 'FMI2')
Course.create(full_name: 'Metodología y tecnología de la programación II', abbreviation: 'MTP2')
Course.create(full_name: 'Sistemas operativos', abbreviation: 'SO')
Course.create(full_name: 'Ingeniería del software de gestión I', abbreviation: 'ISG1')

Course.create(full_name: 'Sistemas Hipermedia', abbreviation: 'SH')
Course.create(full_name: 'Redes Telemáticas', abbreviation: 'RT')
Course.create(full_name: 'Sistemas integrados de gestión II', abbreviation: 'SIG2')
Course.create(full_name: 'Seguridad Informática', abbreviation: 'SI')
Course.create(full_name: 'Ingeniería del software de gestión II', abbreviation: 'ISG2')
Course.create(full_name: 'Sistemas de información global', abbreviation: 'SIGL')
Course.create(full_name: 'Seguridad y medios de pagos', abbreviation: 'SYP')
Course.create(full_name: 'Programación Web Avanzada', abbreviation: 'PWA')
Course.create(full_name: 'Ampliación de bases de datos', abbreviation: 'BD2')

20.times do |i|
  Fabricate(:user)
end

10.times do
  Fabricate(:user, :first_name => 'hugo')
end