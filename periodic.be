class periodic
    def interval = 1000
    def id
    def init(id)
        self.start()
        self.id = id
    end

    def deinit()
        tasmota.remove_timer(self.id)
    end

    def remove()
        tasmota.remove_timer(self.id)
    end

    def start()
        self.set_timer()
    end

    def set_timer()
        tasmota.set_timer(self.interval,/args -> self.tick(args),self.id)  
    end

    def tick()
        self.set_timer()
        self.periodic()
    end

    def periodic()
        print("periodic() called")
    end
end

p=periodic()