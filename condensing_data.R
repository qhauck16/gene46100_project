for (chr in c(2:22, 'X')){
  hi = 0
  for (file in list.files(paste0('chr', chr))){
    print(file)
    if (hi == 0){
      df <- fread(paste0('chr', chr, '/', file))
      hi = 1
    }else{
      df <- full_join(df, fread(paste0('chr', chr, '/', file)), by = 'rail_id')
    }
  }
  write_tsv(df, paste0('chr', chr, '/', chr, '_full_aml_loadings.tsv'))
}
