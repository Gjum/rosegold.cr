require "../packet"

class Rosegold::Clientbound::Disconnect < Rosegold::Clientbound::Packet
  class_getter packet_id = 0x1a_u8

  property reason : Chat

  def initialize(@reason); end

  def self.read(packet)
    self.new Chat.from_json(packet.read_var_string)
  end

  def callback(client)
    client.connection.disconnect reason
  end
end