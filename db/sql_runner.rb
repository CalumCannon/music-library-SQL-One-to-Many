require('pg')

class SqlRunner

  def SqlRunner.run(sql, values = [])
    # connect
    db = PG.connect({host: 'localhost', dbname: 'music_library'})
    begin
      # prepare
      db.prepare("query",sql)
      # results
      results = db.exec_prepared("query", values)
      # close
     ensure
       db.close
     end
    # return
    return results
  end

end
