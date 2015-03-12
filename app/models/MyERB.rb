class MyERB < ERB
  def set_eoutvar(compiler, eoutvar = '_erbout')
    compiler.put_cmd    = "#{eoutvar}.write"
    compiler.insert_cmd = "#{eoutvar}.write"
    compiler.pre_cmd    = []
    compiler.post_cmd   = []
  end
end
