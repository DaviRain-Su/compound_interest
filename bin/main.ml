(* 复利计算器（带年度定投和CSV输出） *)

(* 计算单年复利 *)
let compound_interest_year principal rate times =
  let r = rate /. 100.0 /. float_of_int times in
  principal *. (1.0 +. r) ** float_of_int times

(* 主函数 *)
let () =
  print_endline "复利计算器（带年度定投）";
  print_string "请输入初始本金: ";
  let initial_principal = read_float () in
  print_string "请输入年利率(%): ";
  let rate = read_float () in
  print_string "请输入每年复利次数: ";
  let times = read_int () in
  print_string "请输入年数: ";
  let years = read_int () in
  print_string "请输入每年追加投资金额: ";
  let yearly_investment = read_float () in

  (* 打开文件用于写入CSV *)
  let out_channel = open_out "./data/investment_data.csv" in
  Printf.fprintf out_channel "Year,Initial Amount,Final Amount,Total Invested\n";

  let rec calculate_yearly amount year total_invested =
    if year <= years then
      let new_amount = compound_interest_year amount rate times in
      let new_total_invested = total_invested +. yearly_investment in
      Printf.fprintf out_channel "%d,%.2f,%.2f,%.2f\n" year amount new_amount new_total_invested;
      calculate_yearly (new_amount +. yearly_investment) (year + 1) new_total_invested
  in
  calculate_yearly initial_principal 1 initial_principal;
  
  close_out out_channel;
  print_endline "数据已保存到 ./data/investment_data.csv"