
ActiveRecord::Base.configurations['development'] = {
  :adapter   => 'sqlite3',
  :database  => 'database.sqlite3'
}

ActiveRecord::Base.configurations['production'] = {
  :adapter   => 'mysql2',
  :encoding  => 'utf8',
  :reconnect => true,
  :database  => 'database',
  :pool      => 5,
  :username  => 'username',
  :password  => 'password',
  :host      => 'host',
  :socket    => '/tmp/mysql.sock'

}

ActiveRecord::Base.configurations['test'] = {
  :adapter   => 'mysql2',
  :encoding  => 'utf8',
  :reconnect => true,
  :database  => 'test',
  :pool      => 5,
  :username  => 'root',
  :password  => '',
  :host      => 'localhost',
  :socket    => '/tmp/mysql.sock'

}
