import java.io.File;
import java.io.FileWriter;
import java.awt.Color;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

public class convert {
	public static void main(String[] args) throws Exception {
		File file= new File("creeper.png");
		BufferedImage img = ImageIO.read(file);
		for (int y = 0; y < img.getHeight(); y++) {
			for (int x = 0; x < img.getWidth(); x++) {
				int pixel = img.getRGB(x,y);
				int address = convertPixel(x, y);
				Color color = new Color(pixel, true);
				System.out.println("\tLOADI " + address + 
								"\n\tOUT PXL_A\n" + 
								"\n\tLOADI " + color.getRed() + 
								"\n\tOUT PXL_R\n" + 
								"\tLOADI " + color.getGreen() + 
								"\n\tOUT PXL_G\n" + 
								"\tLOADI " + color.getBlue() + 
								"\n\tOUT PXL_B\n" + 
								"\tOUT PXL_D\n");				
			}
		}

	}
// 160-191
// 159-128
// 96-127
// 95-64
// 32-63
// 31-0

	public static int convertPixel(int x, int y) {
		switch(y) {
			case 0:
				return 160 + x;
			case 1:
				return 159 - x;
			case 2:
				return 96 + x;
			case 3:
				return 95 - x;
			case 4:
				return 32 + x;
			case 5:
				return 31 - x;
			default:
			return 0;
		}
	}
}