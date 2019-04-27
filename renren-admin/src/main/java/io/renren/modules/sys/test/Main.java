package io.renren.modules.sys.test;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/4/11
 * Time: 11:55
 * To change this template use File | Settings | File Templates.
 * Description:
 */
public class Main {
    public static void main(String[] args) {
        Truck truck = new Truck();
        truck.VehicleRun();
        truck.TruckRun();

        SmailTruck smailTruck = new SmailTruck();
        smailTruck.VehicleRun();
        smailTruck.TruckRun();
        smailTruck.SmmailTruckRun();
    }
}