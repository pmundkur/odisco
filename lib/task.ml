type disco_interface = {
  taskname : string;
  hostname : string;
  input_url: string;
  output : ?label:int -> key:string -> string -> unit;
  log : string -> unit;
}

module type TASK = sig
  type map_init
  val map_init : disco_interface -> map_init
  val map : map_init -> disco_interface -> in_channel -> unit
  val map_done : map_init -> disco_interface -> unit

  type reduce_init
  val reduce_init : disco_interface -> reduce_init
  val reduce : reduce_init -> disco_interface -> in_channel -> unit
  val reduce_done : reduce_init -> disco_interface -> unit
end