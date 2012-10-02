module DatafilesHelper

  def current_datafile=(datafile)
    @current_datafile = datafile
  end

  def current_datafile?(datafile)
    datafile == current_datafile
  end

end
