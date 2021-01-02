ENT.Type            = "anim"
ENT.Base            = "gmod_subway_base"

ENT.PrintName       = "D (81-702) int"
ENT.Author          = ""
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "Metrostroi (trains)"
ENT.SkinsType = "81-702"
ENT.Model = "models/metrostroi_train/81-702/81-702.mdl"

ENT.Spawnable       = true
ENT.AdminSpawnable  = false

ENT.DontAccelerateSimulation = false

function ENT:PassengerCapacity()
    return 300
end

function ENT:GetStandingArea()
    return Vector(-450,-30,-55),Vector(380,30,-55)
end

local function GetDoorPosition(i,k)
    return Vector(359.0 - 35/2 - 229.5*i,-65*(1-2*k),7.5)
end
ENT.AnnouncerPositions = {
    {Vector(412,-49 ,61),80,0.2},
    {Vector(-3,-60, 62),300,0.3},
    {Vector(-3,60 ,62),300,0.3},
}

ENT.Cameras = {
    {Vector(407.5+25,32,25),Angle(0,180,0),"Train.702.Breakers1"},
    {Vector(407.5+27,46,21),Angle(0,180,0),"Train.702.Breakers2"},
    {Vector(407.5+35,-25,23),Angle(0,180,0),"Train.702.Breakers3"},
    {Vector(407.5+40,40,12),Angle(0,80,0),"Train.Common.HelpersPanel"},
    {Vector(407.5+20,40,5),Angle(30,10,0),"Train.703.Parking"},
    {Vector(450+13,0,26),Angle(60,0,0),"Train.Common.CouplerCamera"},
}
function ENT:InitializeSounds()
     self.BaseClass.InitializeSounds(self)
    self.SoundNames["rolling_5"] = {loop=true,"subway_trains/common/junk/junk_background3.wav"}
    self.SoundNames["rolling_10"] = {loop=true,"subway_trains/717/rolling/10_rolling.wav"}
    self.SoundNames["rolling_40"] = {loop=true,"subway_trains/717/rolling/40_rolling.wav"}
    self.SoundNames["rolling_70"] = {loop=true,"subway_trains/717/rolling/70_rolling.wav"}
    self.SoundNames["rolling_80"] = {loop=true,"subway_trains/717/rolling/80_rolling.wav"}
    self.SoundPositions["rolling_5"] = {480,1e12,Vector(0,0,0),0.10}
    self.SoundPositions["rolling_10"] = {480,1e12,Vector(0,0,0),0.17}
    self.SoundPositions["rolling_40"] = {480,1e12,Vector(0,0,0),0.40}
    self.SoundPositions["rolling_70"] = {480,1e12,Vector(0,0,0),0.52}
    self.SoundPositions["rolling_80"] = {480,1e12,Vector(0,0,0),0.75}

    self.SoundNames["rolling_motors"] = {loop=true,"subway_trains/ezh/rolling/rolling_motors.wav"}
    self.SoundPositions["rolling_motors"] = {480,1e12,Vector(0,0,0),.4}

    self.SoundNames["rolling_low"] = {loop=true,"subway_trains/717/rolling/rolling_outside_low.wav"}
    self.SoundNames["rolling_medium1"] = {loop=true,"subway_trains/717/rolling/rolling_outside_medium1.wav"}
    self.SoundNames["rolling_medium2"] = {loop=true,"subway_trains/717/rolling/rolling_outside_medium2.wav"}
    self.SoundNames["rolling_high2"] = {loop=true,"subway_trains/717/rolling/rolling_outside_high2.wav"}
    self.SoundPositions["rolling_low"] = {480,1e12,Vector(0,0,0),0.6}
    self.SoundPositions["rolling_medium1"] = {600,1e12,Vector(0,0,0),1}
    self.SoundPositions["rolling_medium2"] = {600,1e12,Vector(0,0,0),1}
    self.SoundPositions["rolling_high2"] = {600,1e12,Vector(0,0,0),1.00}

    self.SoundNames["pneumo_disconnect2"] = "subway_trains/common/pneumatic/pneumo_close.mp3"
    self.SoundNames["pneumo_disconnect1"] = {
        "subway_trains/common/pneumatic/pneumo_open.mp3",
        "subway_trains/common/pneumatic/pneumo_open2.mp3",
    }
    self.SoundPositions["pneumo_disconnect2"] = {60,1e9,Vector(431.8,-50.1+1.5,-33.7),1}
    self.SoundPositions["pneumo_disconnect1"] = {60,1e9,Vector(431.8,-50.1+1.5,-33.7),1}
    self.SoundNames["epv_on"]           = "subway_trains/common/pneumatic/epv_on.mp3"
    self.SoundNames["epv_off"]          = "subway_trains/common/pneumatic/epv_off.mp3"
    self.SoundPositions["epv_on"] = {100,1e9,Vector(437.2,-53.1,-32.0),1}
    self.SoundPositions["epv_off"] = {100,1e9,Vector(437.2,-53.1,-32.0),1}
    self.SoundPositions["epv_off"] = {60,1e9,Vector(437.2,-53.1,-32.0),1}
    -- Релюшки
    --Подвагонка
    self.SoundNames["lk2_on"] = "subway_trains/717/pneumo/lk1_on.mp3"
    self.SoundNames["lk2_off"] = "subway_trains/717/pneumo/lk2_off.mp3"
    self.SoundNames["lk3_on"] = "subway_trains/717/pneumo/lk2_on.mp3"
    self.SoundNames["lk3_off"] = "subway_trains/717/pneumo/lk2_off.mp3"
    self.SoundNames["lk4_on"] = "subway_trains/717/pneumo/lk3_on.mp3"
    self.SoundNames["lk4_off"] = "subway_trains/717/pneumo/lk3_off.mp3"
    self.SoundPositions["lk2_on"] = {440,1e9,Vector(-60,-40,-66),0.33}
    self.SoundPositions["lk2_off"] = {440,1e9,Vector(-60,-40,-66),0.3}
    self.SoundPositions["lk3_on"] = self.SoundPositions["lk2_on"]
    self.SoundPositions["lk3_off"] = self.SoundPositions["lk2_off"]
    self.SoundPositions["lk4_on"] = self.SoundPositions["lk2_on"]
    self.SoundPositions["lk4_off"] = self.SoundPositions["lk2_off"]
    self.SoundNames["RKR"] = "subway_trains/d/pneumatic/rvr.mp3"
    self.SoundPositions["RKR"] = {200,1e9,Vector(-27,-40,-66),0.25}
    self.SoundNames["T"] = "subway_trains/d/pneumatic/rvr.mp3"
    self.SoundPositions["T"] = {200,1e9,Vector(-27,-40,-66),0.25}

    self.SoundNames["compressor"] = {loop=2.0,"subway_trains/d/pneumatic/compressor/compessor_d_start.wav","subway_trains/d/pneumatic/compressor/compessor_d_loop.wav", "subway_trains/d/pneumatic/compressor/compessor_d_end.wav"}
    self.SoundPositions["compressor"] = {450,1e9,Vector(-118,-40,-66),0.75}
    self.SoundNames["prk1"] = {}
    for i=1,14 do self.SoundNames["prk1"][i] = "subway_trains/d/pneumatic/rk/spin1_"..i..".wav" end
    self.SoundPositions["prk1"] = {100,1e3,Vector(110,-40,-75),0.33}
    self.SoundNames["prk2"] = {}
    for i=1,12 do self.SoundNames["prk2"][i] = "subway_trains/d/pneumatic/rk/spin2_"..i..".wav" end
    self.SoundPositions["prk2"] = self.SoundPositions["prk1"]
    self.SoundNames["PN1end"] = "subway_trains/d/pneumatic/vz1_end.mp3"
    self.SoundPositions["PN1end"] = {300,1e9,Vector(-183,0,-70),0.65}
    self.SoundNames["PN2end"] = {"subway_trains/common/pneumatic/vz2_end.mp3","subway_trains/common/pneumatic/vz2_end_2.mp3","subway_trains/common/pneumatic/vz2_end_3.mp3","subway_trains/common/pneumatic/vz2_end_4.mp3"}
    self.SoundPositions["PN2end"] = {350,1e9,Vector(-183,0,-70),0.3}

    self.SoundNames["ezh3_revers_0-f"] = {"subway_trains/717/kv70/reverser_0-f_1.mp3","subway_trains/717/kv70/reverser_0-f_2.mp3"}
    self.SoundNames["ezh3_revers_f-0"] = {"subway_trains/717/kv70/reverser_f-0_1.mp3","subway_trains/717/kv70/reverser_f-0_2.mp3"}
    self.SoundNames["ezh3_revers_0-b"] = {"subway_trains/717/kv70/reverser_0-b_1.mp3","subway_trains/717/kv70/reverser_0-b_2.mp3"}
    self.SoundNames["ezh3_revers_b-0"] = {"subway_trains/717/kv70/reverser_b-0_1.mp3","subway_trains/717/kv70/reverser_b-0_2.mp3"}
    self.SoundNames["revers_in"] = {"subway_trains/ezh3/kv66/revers_in.mp3"}
    self.SoundNames["revers_out"] = {"subway_trains/ezh3/kv66/revers_out.mp3"}
    self.SoundNames["rcu_in"] = {"subway_trains/ezh3/kv66/revers_in.mp3"}
    self.SoundNames["rcu_out"] = {"subway_trains/ezh3/kv66/revers_out.mp3"}
    self.SoundNames["rcu_on"] = {"subway_trains/ezh3/kv66/rcu_on.mp3","subway_trains/ezh3/kv66/rcu_on2.mp3"}
    self.SoundNames["rcu_off"] = "subway_trains/ezh3/kv66/rcu_off.mp3"
    self.SoundPositions["ezh3_revers_0-f"] = {80,1e9,Vector(453.66,-21,-15)}
    self.SoundPositions["ezh3_revers_f-0"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["ezh3_revers_0-b"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["ezh3_revers_b-0"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["revers_in"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["revers_out"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["rcu_on"] = {80,1e9,Vector(411.9,-26.4,-11.2)}
    self.SoundPositions["rcu_off"] = self.SoundPositions["rcu_on"]
    self.SoundPositions["rcu_in"] = self.SoundPositions["rcu_on"]
    self.SoundPositions["rcu_out"] = self.SoundPositions["rcu_on"]

    self.SoundNames["kru_in"] = {
        "subway_trains/717/kru/kru_insert1.mp3",
        "subway_trains/717/kru/kru_insert2.mp3"
    }
    self.SoundPositions["kru_in"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundNames["kru_out"] = {
        "subway_trains/717/kru/kru_eject1.mp3",
        "subway_trains/717/kru/kru_eject2.mp3",
        "subway_trains/717/kru/kru_eject3.mp3",
    }
    self.SoundPositions["kru_out"] = {80,1e9,Vector(452.3,-24.0,4.0)}

    self.SoundNames["kru_0_1"] = {
        "subway_trains/717/kru/kru0-1_1.mp3",
        "subway_trains/717/kru/kru0-1_2.mp3",
        "subway_trains/717/kru/kru0-1_3.mp3",
        "subway_trains/717/kru/kru0-1_4.mp3",
    }
    self.SoundNames["kru_1_2"] = {
        "subway_trains/717/kru/kru1-2_1.mp3",
        "subway_trains/717/kru/kru1-2_2.mp3",
        "subway_trains/717/kru/kru1-2_3.mp3",
        "subway_trains/717/kru/kru1-2_4.mp3",
    }
    self.SoundNames["kru_2_1"] = {
        "subway_trains/717/kru/kru2-1_1.mp3",
        "subway_trains/717/kru/kru2-1_2.mp3",
        "subway_trains/717/kru/kru2-1_3.mp3",
        "subway_trains/717/kru/kru2-1_4.mp3",
    }
    self.SoundNames["kru_1_0"] = {
        "subway_trains/717/kru/kru1-0_1.mp3",
        "subway_trains/717/kru/kru1-0_2.mp3",
        "subway_trains/717/kru/kru1-0_3.mp3",
        "subway_trains/717/kru/kru1-0_4.mp3",
    }
    self.SoundNames["kru_2_3"] = {
        "subway_trains/717/kru/kru2-3_1.mp3",
        "subway_trains/717/kru/kru2-3_2.mp3",
        "subway_trains/717/kru/kru2-3_3.mp3",
        "subway_trains/717/kru/kru2-3_4.mp3",
    }
    self.SoundNames["kru_3_2"] = {
        "subway_trains/717/kru/kru3-2_1.mp3",
        "subway_trains/717/kru/kru3-2_2.mp3",
        "subway_trains/717/kru/kru3-2_3.mp3",
        "subway_trains/717/kru/kru3-2_4.mp3",
    }
    self.SoundPositions["kru_0_1"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_1_2"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_2_1"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_1_0"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_2_3"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_3_2"] = {80,1e9,Vector(452.3,-24.0,4.0)}

    self.SoundNames["kr_open"] = {
        "subway_trains/717/cover/cover_open1.mp3",
        "subway_trains/717/cover/cover_open2.mp3",
        "subway_trains/717/cover/cover_open3.mp3",
    }
    self.SoundNames["kr_close"] = {
        "subway_trains/717/cover/cover_close1.mp3",
        "subway_trains/717/cover/cover_close2.mp3",
        "subway_trains/717/cover/cover_close3.mp3",
    }

    self.SoundNames["vb1a_off"] = {
        "subway_trains/d/vb1a/vb1a_off1.wav",
        "subway_trains/d/vb1a/vb1a_off2.wav",
        "subway_trains/d/vb1a/vb1a_off3.wav",
    }
    self.SoundNames["vb1a_on"] = {
        "subway_trains/d/vb1a/vb1a_on1.wav",
        "subway_trains/d/vb1a/vb1a_on2.wav",
        "subway_trains/d/vb1a/vb1a_on3.wav",
    }

    self.SoundNames["vu220b1_off"] = {
        "subway_trains/d/vu220b1/vu220b1_off1.wav",
        "subway_trains/d/vu220b1/vu220b1_off2.wav",
        "subway_trains/d/vu220b1/vu220b1_off3.wav",
        "subway_trains/d/vu220b1/vu220b1_off4.wav",
        "subway_trains/d/vu220b1/vu220b1_off5.wav",
    }
    self.SoundNames["vu220b1_on"] = {
        "subway_trains/d/vu220b1/vu220b1_on1.wav",
        "subway_trains/d/vu220b1/vu220b1_on2.wav",
        "subway_trains/d/vu220b1/vu220b1_on3.wav",
        "subway_trains/d/vu220b1/vu220b1_on4.wav",
        "subway_trains/d/vu220b1/vu220b1_on5.wav",
    }

    self.SoundNames["vu13a_off"] = {
        "subway_trains/d/vu13a/vu13a_off1.wav",
        "subway_trains/d/vu13a/vu13a_off2.wav",
        "subway_trains/d/vu13a/vu13a_off3.wav",
        "subway_trains/d/vu13a/vu13a_off4.wav",
        "subway_trains/d/vu13a/vu13a_off5.wav",
    }
    self.SoundNames["vu13a_on"] = {
        "subway_trains/d/vu13a/vu13a_on1.wav",
        "subway_trains/d/vu13a/vu13a_on2.wav",
        "subway_trains/d/vu13a/vu13a_on3.wav",
        "subway_trains/d/vu13a/vu13a_on4.wav",
    }

    self.SoundNames["switch_off"] = {
        "subway_trains/717/switches/tumbler_slim_off1.mp3",
        "subway_trains/717/switches/tumbler_slim_off2.mp3",
        "subway_trains/717/switches/tumbler_slim_off3.mp3",
        "subway_trains/717/switches/tumbler_slim_off4.mp3",
    }
    self.SoundNames["switch_on"] = {
        "subway_trains/717/switches/tumbler_slim_on1.mp3",
        "subway_trains/717/switches/tumbler_slim_on2.mp3",
        "subway_trains/717/switches/tumbler_slim_on3.mp3",
        "subway_trains/717/switches/tumbler_slim_on4.mp3",
    }

    self.SoundNames["switchbl_off"] = {
        "subway_trains/717/switches/tumbler_fatb_off1.mp3",
        "subway_trains/717/switches/tumbler_fatb_off2.mp3",
        "subway_trains/717/switches/tumbler_fatb_off3.mp3",
    }
    self.SoundNames["switchbl_on"] = {
        "subway_trains/717/switches/tumbler_fatb_on1.mp3",
        "subway_trains/717/switches/tumbler_fatb_on2.mp3",
        "subway_trains/717/switches/tumbler_fatb_on3.mp3",
    }

    self.SoundNames["triple_down-0"] = {
        "subway_trains/717/switches/tumbler_triple_down-0_1.mp3",
        "subway_trains/717/switches/tumbler_triple_down-0_2.mp3",
    }
    self.SoundNames["triple_0-up"] = {
        "subway_trains/717/switches/tumbler_triple_0-up_1.mp3",
        "subway_trains/717/switches/tumbler_triple_0-up_2.mp3",
    }
    self.SoundNames["triple_up-0"] = {
        "subway_trains/717/switches/tumbler_triple_up-0_1.mp3",
        "subway_trains/717/switches/tumbler_triple_up-0_2.mp3",
    }
    self.SoundNames["triple_0-down"] = {
        "subway_trains/717/switches/tumbler_triple_0-down_1.mp3",
        "subway_trains/717/switches/tumbler_triple_0-down_2.mp3",
    }
    self.SoundNames["button1_off"] = {
        "subway_trains/ezh3/switches/button_off1.mp3",
        "subway_trains/ezh3/switches/button_off2.mp3",
    }
    self.SoundNames["button1_on"] = {
        "subway_trains/ezh3/switches/button_on1.mp3",
        "subway_trains/ezh3/switches/button_on2.mp3",
    }
    self.SoundNames["button2_off"] = {
        "subway_trains/ezh3/switches/button_off3.mp3",
        "subway_trains/ezh3/switches/button_off4.mp3",
    }
    self.SoundNames["button2_on"] = {
        "subway_trains/ezh3/switches/button_on3.mp3",
        "subway_trains/ezh3/switches/button_on4.mp3",
    }
    self.SoundNames["button3_off"] = {
        "subway_trains/ezh3/switches/button_off6.mp3",
        "subway_trains/ezh3/switches/button_off5.mp3",
    }
    self.SoundNames["button3_on"] = {
        "subway_trains/ezh3/switches/button_on5.mp3",
        "subway_trains/ezh3/switches/button_on6.mp3",
    }

    self.SoundNames["uava_reset"] = {
        "subway_trains/common/uava/uava_reset1.mp3",
        "subway_trains/common/uava/uava_reset2.mp3",
        "subway_trains/common/uava/uava_reset4.mp3",
    }
    self.SoundPositions["uava_reset"] = {80,1e9,Vector(449.14598,56.0,-10.23349),0.6}
    self.SoundNames["gv_f"] = {"subway_trains/ezh3/kv66/rcu_on.mp3","subway_trains/ezh3/kv66/rcu_on2.mp3"}
    self.SoundNames["gv_b"] = "subway_trains/ezh3/kv66/rcu_off.mp3"
    self.SoundPositions["gv_f"]     = {80,1e2,Vector(153.5,36,-78),0.5}
    self.SoundPositions["gv_b"]     = self.SoundPositions["gv_f"]

    self.SoundNames["disconnect_valve"] = "subway_trains/common/switches/pneumo_disconnect_switch.mp3"

    --Краны
    self.SoundNames["brake_f"] = {"subway_trains/common/pneumatic/vz_brake_on2.mp3","subway_trains/common/pneumatic/vz_brake_on3.mp3","subway_trains/common/pneumatic/vz_brake_on4.mp3"}
    self.SoundPositions["brake_f"] = {50,1e9,Vector(317-8,0,-82),0.13}
    self.SoundNames["brake_b"] = self.SoundNames["brake_f"]
    self.SoundPositions["brake_b"] = {50,1e9,Vector(-317+0,0,-82),0.13}
    self.SoundNames["release1"] = {loop=true,"subway_trains/common/pneumatic/release_0.wav"}
    self.SoundPositions["release1"] = {350,1e9,Vector(-183,0,-70),1}
    self.SoundNames["release2"] = {loop=true,"subway_trains/common/pneumatic/release_low.wav"}
    self.SoundPositions["release2"] = {350,1e9,Vector(-183,0,-70),0.4}

    self.SoundNames["front_isolation"] = {loop=true,"subway_trains/common/pneumatic/isolation_leak.wav"}
    self.SoundPositions["front_isolation"] = {300,1e9,Vector(452, 0,-63),1}
    self.SoundNames["rear_isolation"] = {loop=true,"subway_trains/common/pneumatic/isolation_leak.wav"}
    self.SoundPositions["rear_isolation"] = {300,1e9,Vector(-474, 0,-63),1}

    self.SoundNames["crane013_brake2"] = {loop=true,"subway_trains/common/pneumatic/013_brake2.wav"}
    self.SoundPositions["crane013_brake2"] = {80,1e9,Vector(453.21,-54.92,-8.50),0.86}
    self.SoundNames["crane334_brake_high"] = {loop=true,"subway_trains/common/pneumatic/334_brake.wav"}
    self.SoundPositions["crane334_brake_high"] = {80,1e9,Vector(453.21,-54.92,-8.50),0.85}
    self.SoundNames["crane334_brake_low"] = {loop=true,"subway_trains/common/pneumatic/334_brake_slow.wav"}
    self.SoundPositions["crane334_brake_low"] = {80,1e9,Vector(453.21,-54.92,-8.50),0.75}
    self.SoundNames["crane334_brake_2"] = {loop=true,"subway_trains/common/pneumatic/334_brake_slow.wav"}
    self.SoundPositions["crane334_brake_2"] = {80,1e9,Vector(453.21,-54.92,-8.50),0.85}
    self.SoundNames["crane334_brake_eq_high"] = {loop=true,"subway_trains/common/pneumatic/334_release_reservuar.wav"}
    self.SoundPositions["crane334_brake_eq_high"] = {80,1e9,Vector(453.21,-54.92,-70),0.45}
    self.SoundNames["crane334_brake_eq_low"] = {loop=true,"subway_trains/common/pneumatic/334_brake_slow2.wav"}
    self.SoundPositions["crane334_brake_eq_low"] = {80,1e9,Vector(453.21,-54.92,-70),0.45}
    self.SoundNames["crane334_release"] = {loop=true,"subway_trains/common/pneumatic/334_release3.wav"}
    self.SoundPositions["crane334_release"] = {80,1e9,Vector(453.21,-54.92,-8.50),0.2}
    self.SoundNames["crane334_release_2"] = {loop=true,"subway_trains/common/pneumatic/334_release2.wav"}
    self.SoundPositions["crane334_release_2"] = {80,1e9,Vector(453.21,-54.92,-8.50),0.2}

    self.SoundNames["valve_brake"] = {loop=true,"subway_trains/common/pneumatic/epv_loop.wav"}
    self.SoundPositions["valve_brake"] = {400,1e9,Vector(464.40,24.4,-50),1}

    --self.SoundNames["emer_brake"] = {loop=0.8,"subway_trains/common/pneumatic/autostop_start.wav","subway_trains/common/pneumatic/autostop_loop.wav", "subway_trains/common/pneumatic/autostop_end.wav"}
    self.SoundNames["emer_brake"] = {loop=true,"subway_trains/common/pneumatic/autostop_loop.wav"}
    self.SoundNames["emer_brake2"] = {loop=true,"subway_trains/common/pneumatic/autostop_loop_2.wav"}
    self.SoundPositions["emer_brake"] = {600,1e9,Vector(380,-65,-75)}
    self.SoundPositions["emer_brake2"] = self.SoundPositions["emer_brake"]

    self.SoundNames["pak_on"] = "subway_trains/717/switches/rc_on.mp3"
    self.SoundNames["pak_off"] = "subway_trains/717/switches/rc_off.mp3"

    self.SoundNames["kv70_fix_on"] = {"subway_trains/717/kv70/kv70_fix_on1.mp3","subway_trains/717/kv70/kv70_fix_on2.mp3"}
    self.SoundNames["kv70_fix_off"] = {"subway_trains/717/kv70/kv70_fix_off1.mp3","subway_trains/717/kv70/kv70_fix_off2.mp3"}
    self.SoundNames["kv40_0_t1"] = {"subway_trains/d/kv20/kv20_0_T1.wav"}
    self.SoundNames["kv40_t1_0"] = {"subway_trains/d/kv20/kv20_T1_0.wav"}
    self.SoundNames["kv40_t1_t1a"] = {"subway_trains/d/kv20/kv20_T1_T1A.wav"}
    self.SoundNames["kv40_t1a_t1"] = {"subway_trains/d/kv20/kv20_T1A_T1.wav"}
    self.SoundNames["kv40_t1a_t2"] = {"subway_trains/d/kv20/kv20_T1A_T2.wav"}
    self.SoundNames["kv40_t2_t1a"] = {"subway_trains/d/kv20/kv20_T2_T1A.wav"}
    self.SoundNames["kv40_0_x1"] = {"subway_trains/d/kv20/kv20_0_X1.wav"}
    self.SoundNames["kv40_x1_0"] = {"subway_trains/d/kv20/kv20_X1_0.wav"}
    self.SoundNames["kv40_x1_x2"] = {"subway_trains/d/kv20/kv20_X1_X2.wav"}
    self.SoundNames["kv40_x2_x1"] = {"subway_trains/d/kv20/kv20_X2_X1.wav"}
    self.SoundNames["kv40_x2_x3"] = {"subway_trains/d/kv20/kv20_X2_X3.wav"}
    self.SoundNames["kv40_x3_x2"] = {"subway_trains/d/kv20/kv20_X3_X2.wav"}
    self.SoundPositions["kv70_fix_on"] =    {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv70_fix_off"] =   {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_0_t1"] =      {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv70_t1_0_fix"] =  {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_t1_0"] =      {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_t1_t1a"] =    {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_t1a_t1"] =    {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_t1a_t2"] =    {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_t2_t1a"] =    {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_0_x1"] =      {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_x1_0"] =      {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_x1_x2"] = {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_x2_x1"] = {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_x2_x3"] = {100,1e9,Vector(453.81,-20.61,-9.47),0.55}
    self.SoundPositions["kv40_x3_x2"] = {100,1e9,Vector(453.81,-20.61,-9.47),0.55}

    self.SoundNames["samm_revers_in"] = {"subway_trains/ezh3/rc_ars/reversor_rc_in.mp3"}
    self.SoundNames["samm_revers_out"] = {"subway_trains/ezh3/rc_ars/reversor_rc_in.mp3"}
    self.SoundNames["samm_0-1"] = {"subway_trains/ezh3/rc_ars/0-1.mp3"}
    self.SoundNames["samm_0-2"] = {"subway_trains/ezh3/rc_ars/0-2.mp3"}
    self.SoundNames["samm_2-0"] = {"subway_trains/ezh3/rc_ars/2-0.mp3"}
    self.SoundPositions["samm_0-2"] = {60,1e9,Vector(442.2-6,-50,-10)}
    self.SoundPositions["samm_2-0"] = {60,1e9,Vector(442.2-6,-50,-10)}
    self.SoundPositions["samm_0-1"] = {60,1e9,Vector(442.2-6,-50,-10)}
    self.SoundPositions["samm_revers_out"] = {60,1e9,Vector(442.2-6,-50,-10)}
    self.SoundPositions["samm_revers_in"] = {60,1e9,Vector(442.2-6,-50,-10)}

    self.SoundNames["ring_old"] = {loop=0.15,"subway_trains/717/ring/ringo_start.wav","subway_trains/717/ring/ringo_loop.wav","subway_trains/717/ring/ringo_end.mp3"}
    self.SoundPositions["ring_old"] = {100,1e9,Vector(400,-40,50),0.5}

    self.SoundNames["vpr"] = {loop=0.8,"subway_trains/common/other/radio/vpr_start.wav","subway_trains/common/other/radio/vpr_loop.wav","subway_trains/common/other/radio/vpr_off.wav"}
    self.SoundPositions["vpr"] = {100,1e9,Vector(412,-49 ,61),0.2}

    self.SoundNames["cab_door_open"] = "subway_trains/common/door/cab/door_open.mp3"
    self.SoundNames["cab_door_close"] = "subway_trains/common/door/cab/door_close.mp3"

    self.SoundNames["parking_brake_rolling"] = {"subway_trains/ezh3/parking_brake_rolling1.mp3","subway_trains/ezh3/parking_brake_rolling2.mp3","subway_trains/ezh3/parking_brake_rolling3.mp3","subway_trains/ezh3/parking_brake_rolling4.mp3"}
    self.SoundPositions["parking_brake_rolling"] = {65,1e9,Vector(449.118378+7.6,33.493385,-14.713276),0.1}
    self.SoundNames["av1a_on"] = {"subway_trains/d/av1a/av1a_on1.wav","subway_trains/d/av1a/av1a_on2.wav","subway_trains/d/av1a/av1a_on3.wav","subway_trains/d/av1a/av1a_on4.wav"}
    self.SoundNames["av1a_off"] = {"subway_trains/d/av1a/av1a_off1.wav","subway_trains/d/av1a/av1a_off2.wav","subway_trains/d/av1a/av1a_off3.wav","subway_trains/d/av1a/av1a_off4.wav","subway_trains/d/av1a/av1a_off5.wav","subway_trains/d/av1a/av1a_off6.wav"}
    self.SoundPositions["av1a_on"] = {100,1e9,Vector(405,40,30)}
    self.SoundPositions["av1a_off"] = {100,1e9,Vector(405,40,30)}

    self.SoundNames["vu22_on"] = {"subway_trains/ezh3/vu/vu22_on1.mp3", "subway_trains/ezh3/vu/vu22_on2.mp3", "subway_trains/ezh3/vu/vu22_on3.mp3"}
    self.SoundNames["vu22_off"] = {"subway_trains/ezh3/vu/vu22_off1.mp3", "subway_trains/ezh3/vu/vu22_off2.mp3", "subway_trains/ezh3/vu/vu22_off3.mp3"}
    self.SoundNames["vu223_on"] = {"subway_trains/common/switches/vu22/vu22_3_on.mp3"}
    self.SoundNames["vu223_off"] = {"subway_trains/common/switches/vu22/vu22_3_off.mp3"}

    self.SoundNames["pneumo_TL_open"] = "subway_trains/common/334/334_open.mp3"
    self.SoundNames["pneumo_TL_disconnect"] = "subway_trains/common/334/334_close.mp3"
    self.SoundNames["pneumo_BL_disconnect"] = "subway_trains/common/334/334_close.mp3"

    self.SoundNames["pneumo_idle"] = {
        "subway_trains/ezh3/pneumatic/idle.wav",
    }
    self.SoundPositions["pneumo_idle"] = {300,1e9,Vector(438.50,-50,-40),1}

        self.SoundNames["igla_on"]  = "subway_trains/common/other/igla/igla_on1.mp3"
        self.SoundNames["igla_off"] = "subway_trains/common/other/igla/igla_off2.mp3"
        self.SoundNames["igla_start1"]  = "subway_trains/common/other/igla/igla2_start1.mp3"
        self.SoundNames["igla_start2"]  = "subway_trains/common/other/igla/igla2_start2.mp3"
        self.SoundPositions["igla_on"] = {50,1e9,Vector(413.4-0.7,-56.7-0.05,6.9-1.15),0.3}
        self.SoundPositions["igla_off"] = {50,1e9,Vector(413.4-0.7,-56.7-0.05,6.9-1.15),0.3}
        self.SoundPositions["igla_start1"] = {50,1e9,Vector(413.4-0.7,-56.7-0.05,6.9-1.15),0.3}
        self.SoundPositions["igla_start2"] = {50,1e9,Vector(413.4-0.7,-56.7-0.05,6.9-1.15),0.2}

    self.SoundNames["upps"]         = {"subway_trains/common/other/upps/upps1.mp3","subway_trains/common/other/upps/upps2.mp3"}
    self.SoundPositions["upps"] = {60,1e9,Vector(443,-64,4),0.5}

    self.SoundNames["pnm_on"]           = {"subway_trains/common/pnm/pnm_switch_on.mp3","subway_trains/common/pnm/pnm_switch_on2.mp3"}
    self.SoundNames["pnm_off"]          = {"subway_trains/common/pnm/pnm_switch_off.mp3","subway_trains/common/pnm/pnm_switch_off2.mp3"}
    self.SoundNames["pnm_button1_on"]           = {
        "subway_trains/common/pnm/pnm_button_push.mp3",
        "subway_trains/common/pnm/pnm_button_push2.mp3",
        "subway_trains/common/pnm/pnm_button_push3.mp3",
    }

    self.SoundNames["pnm_button2_on"]           = {
        "subway_trains/common/pnm/pnm_button_push4.mp3",
        "subway_trains/common/pnm/pnm_button_push5.mp3",
        "subway_trains/common/pnm/pnm_button_push6.mp3",
    }

    self.SoundNames["pnm_button1_off"]          = {
        "subway_trains/common/pnm/pnm_button_release.mp3",
        "subway_trains/common/pnm/pnm_button_release2.mp3",
        "subway_trains/common/pnm/pnm_button_release3.mp3",
    }

    self.SoundNames["pnm_button2_off"]          = {
        "subway_trains/common/pnm/pnm_button_release4.mp3",
        "subway_trains/common/pnm/pnm_button_release5.mp3",
        "subway_trains/common/pnm/pnm_button_release6.mp3",
    }

    self.SoundNames["horn"] = {loop=0.5,"subway_trains/d/pneumatic/horn/horn_start.wav","subway_trains/d/pneumatic/horn/horn_loop.wav", "subway_trains/d/pneumatic/horn/horn_end.wav"}
    self.SoundPositions["horn"] = {1100,1e9,Vector(480,-30,30)}

    --DOORS
    self.SoundNames["vdol_on"] = {
        "subway_trains/common/pneumatic/door_valve/VDO_on.mp3",
        "subway_trains/common/pneumatic/door_valve/VDO2_on.mp3",
    }
    self.SoundNames["vdol_off"] = {
        "subway_trains/common/pneumatic/door_valve/VDO_off.mp3",
        "subway_trains/common/pneumatic/door_valve/VDO2_off.mp3",
    }
    self.SoundPositions["vdol_on"] = {100,1e9,Vector(410,20,-45)}
    self.SoundPositions["vdol_off"] = {100,1e9,Vector(410,20,-45)}
    self.SoundNames["vdor_on"] = self.SoundNames["vdol_on"]
    self.SoundNames["vdor_off"] = self.SoundNames["vdol_off"]
    self.SoundPositions["vdor_on"] = self.SoundPositions["vdol_on"]
    self.SoundPositions["vdor_off"] = self.SoundPositions["vdol_off"]
    self.SoundNames["vdol_loud"] = "subway_trains/common/pneumatic/door_valve/vdo3_on.mp3"
    self.SoundNames["vdop_loud"] = self.SoundNames["vdol_loud"]
    self.SoundPositions["vdol_loud"] = {100,1e9,Vector(410,20,-45),1}
    self.SoundPositions["vdop_loud"] = self.SoundPositions["vdol_loud"]
    self.SoundNames["vdz_on"] = {
        "subway_trains/common/pneumatic/door_valve/VDZ_on.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ2_on.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ3_on.mp3",
    }
    self.SoundNames["vdz_off"] = {
        "subway_trains/common/pneumatic/door_valve/VDZ_off.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ2_off.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ3_off.mp3",
    }
    self.SoundPositions["vdz_on"] = {100,1e9,Vector(410,20,-45)}
    self.SoundPositions["vdz_off"] = {100,1e9,Vector(410,20,-45)}

    for i=0,3 do
        for k=0,1 do
            self.SoundNames["door"..i.."x"..k.."r"] = {"subway_trains/d/door_roll.wav",loop=true}
            self.SoundPositions["door"..i.."x"..k.."r"] = {150,1e9,GetDoorPosition(i,k),0.7}
            self.SoundNames["door"..i.."x"..k.."o"] = {"subway_trains/d/door_open_end.wav","subway_trains/d/door_open_end2.wav"}
            self.SoundPositions["door"..i.."x"..k.."o"] = {150,1e9,GetDoorPosition(i,k),0.7}
            self.SoundNames["door"..i.."x"..k.."c"] = {"subway_trains/d/door_close_end.wav","subway_trains/d/door_close_end2.wav",}
            self.SoundPositions["door"..i.."x"..k.."c"] = self.SoundPositions["door"..i.."x"..k.."o"]
            self.SoundNames["door"..i.."x"..k.."so"] = {"subway_trains/d/door_open_start2.wav","subway_trains/d/door_start_open.wav"}
            self.SoundPositions["door"..i.."x"..k.."so"] = self.SoundPositions["door"..i.."x"..k.."o"]
            self.SoundNames["door"..i.."x"..k.."sc"] = {"subway_trains/d/door_close_start.wav","subway_trains/d/door_close_start2.wav",}
            self.SoundPositions["door"..i.."x"..k.."sc"] = self.SoundPositions["door"..i.."x"..k.."o"]
        end
    end

    for k,v in ipairs(self.AnnouncerPositions) do
        self.SoundNames["announcer_noise1_"..k] = {loop=true,"subway_announcers/upo/noiseS1.wav"}
        self.SoundPositions["announcer_noise1_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.5}
        self.SoundNames["announcer_noise2_"..k] = {loop=true,"subway_announcers/upo/noiseS2.wav"}
        self.SoundPositions["announcer_noise2_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.5}
    end


    self.SoundNames["junk_small"] = {
        "subway_trains/common/junk/junk_small1.mp3",
        "subway_trains/common/junk/junk_small2.mp3",
        "subway_trains/common/junk/junk_small3.mp3",
        "subway_trains/common/junk/junk_small4.mp3",
        "subway_trains/common/junk/junk_small5.mp3",
        "subway_trains/common/junk/junk_small6.mp3",
    }
    self.SoundNames["junk_medium"] = {
        "subway_trains/common/junk/junk_medium1.mp3",
        "subway_trains/common/junk/junk_medium2.mp3",
        "subway_trains/common/junk/junk_medium3.mp3",
        "subway_trains/common/junk/junk_medium4.mp3",
        "subway_trains/common/junk/junk_medium5.mp3",
        "subway_trains/common/junk/junk_medium6.mp3",
    }
    self.SoundNames["junk_enginestart_speed"] = {
        "subway_trains/common/junk/junk_enginestart_speed1.mp3",
        "subway_trains/common/junk/junk_enginestart_speed2.mp3",
        "subway_trains/common/junk/junk_enginestart_speed3.mp3",
        "subway_trains/common/junk/junk_enginestart_speed4.mp3",
        "subway_trains/common/junk/junk_enginestart_speed5.mp3",
        "subway_trains/common/junk/junk_enginestart_speed6.mp3",
    }
end

function ENT:InitializeSystems()
    self:LoadSystem("Electric","81_702_Electric")

    -- Токоприёмник
    self:LoadSystem("TR","TR_3B")
    -- Электротяговые двигатели
    self:LoadSystem("Engines","DK_104G")

    -- Резисторы для реостата/пусковых сопротивлений
    self:LoadSystem("KF_6A")
    -- Резисторы для ослабления возбуждения
    self:LoadSystem("KF_7A")

    -- Реостатный контроллер для управления пусковыми сопротивления
    self:LoadSystem("RheostatController","PKG_758B")
    -- Групповой переключатель положений
    self:LoadSystem("PositionSwitch","PKG_759B")
    -- Кулачковый контроллер
    self:LoadSystem("KV","KV_20")
    --Разоеденитель управления м мотовор


    -- Ящики с реле и контакторами
    self:LoadSystem("LK_753B")
    self:LoadSystem("LK_753V")
    self:LoadSystem("YAR_10A")
    self:LoadSystem("YAK_4K")

    -- Пневмосистема 81-703
    self:LoadSystem("Pneumatic","81_702_Pneumatic")
    -- Панель управления Д
    self:LoadSystem("Panel","81_702_Panel")
    -- Everything else
    self:LoadSystem("Battery")
    self:LoadSystem("Horn")

    self:LoadSystem("ALSCoil")

    self:LoadSystem("Announcer","81_71_Announcer", "AnnouncementsRRI")
end
function ENT:PostInitializeSystems()
    self.Electric:TriggerInput("Type",self.Electric.DcI)
    if self.VU then self.VU:TriggerInput("Set",0) end
end

ENT.SubwayTrain = {
    Type = "D",
    Name = "81-702",
    Manufacturer = "MVM",
    WagType = 2,
    ARS = {
        HaveASNP = false,
        NoEPK = true,
        NoUAVA = true,
    },
    ALS = {
        HaveAutostop = true,
    },
    EKKType = 702,
}

ENT.NumberRanges = {{807,1000},{2001,2468}}