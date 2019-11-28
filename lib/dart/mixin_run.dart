//Mixin 是一种在多重继承中复用某个类中代码的方法模式

abstract class Cpu {
  void cpu();
}

abstract class GraphicsCard {
  void graphicsCard();
}

abstract class Computer with Cpu, GraphicsCard {
  void startup() {
    cpu();
    graphicsCard();
  }
}

class LOLComputer extends Computer {
  @override
  void cpu() {
    print("Intel cpu");
  }

  @override
  void graphicsCard() {
    print("Nivadia graphics card");
  }
}

mixin IntelCpu implements Cpu {
  void cpu() => print("Intel cpu");
}

mixin AMDCpu implements Cpu {
  void cpu() => print("AMD cpu");
}

mixin NvadiaGraphicsCard implements GraphicsCard {
  void graphicsCard() => print("Nivadia graphics card");
}

mixin AMDGraphicsCard implements GraphicsCard {
  void graphicsCard() => print("AMD graphics card");
}

class TAComputer extends Computer with AMDCpu, AMDGraphicsCard {}

class HackintoshComputer extends Computer with IntelCpu, AMDGraphicsCard {}

// 多个 mixin 方法时会使用放置在后方类的实现
class UnbelievableComputer extends Computer
    with IntelCpu, AMDCpu, NvadiaGraphicsCard, AMDGraphicsCard {}

main(List<String> args) {
  var taComputer = TAComputer()..startup();
  assert(taComputer is TAComputer);
  assert(taComputer is AMDCpu);
  assert(taComputer is AMDGraphicsCard);
  HackintoshComputer().startup();
  UnbelievableComputer().startup();
}