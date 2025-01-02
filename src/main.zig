// raylib-zig (c) Nikolas Wipper 2023

const rl = @import("raylib");

const GameScreen = enum { LOGO, TITLE, GAMEPLAY, ENDING };

pub fn main() anyerror!void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    var currentScreen: GameScreen = GameScreen.LOGO;

    var framesCounter: u32 = 0;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(60); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    while (!rl.windowShouldClose()) { // Detect window close button or ESC key

        switch (currentScreen) {
            .LOGO => {
                framesCounter += 1;

                if (framesCounter > 120) {
                    currentScreen = .TITLE;
                }
            },

            .TITLE => {
                if (rl.isKeyPressed(rl.KeyboardKey.enter) or rl.isGestureDetected(rl.Gesture.tap)) {
                    currentScreen = .GAMEPLAY;
                }
            },

            .GAMEPLAY => {
                if (rl.isKeyPressed(rl.KeyboardKey.enter) or rl.isGestureDetected(rl.Gesture.tap)) {
                    currentScreen = .ENDING;
                }
            },

            .ENDING => {
                if (rl.isKeyPressed(rl.KeyboardKey.enter) or rl.isGestureDetected(rl.Gesture.tap)) {
                    currentScreen = .TITLE;
                }
            },
        }

        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.white);

        switch (currentScreen) {
            .LOGO => {
                rl.drawText("LOGO SCREEN", 20, 20, 40, rl.Color.light_gray);
                rl.drawText("WAIT for 2 seconds...", 290, 220, 40, rl.Color.light_gray);
            },

            .TITLE => {
                rl.drawRectangle(0, 0, screenWidth, screenHeight, rl.Color.green);
                rl.drawText("TITLE SCREEN", 20, 20, 40, rl.Color.dark_green);
                rl.drawText("Press ENTER or TAP to jump to ending screen", 120, 220, 20, rl.Color.dark_green);
            },

            .GAMEPLAY => {
                rl.drawRectangle(0, 0, screenWidth, screenHeight, rl.Color.purple);
                rl.drawText("GAMEPLAY SCREEN", 20, 20, 40, rl.Color.maroon);
                rl.drawText("Press ENTER or TAP to jump to ending screen", 130, 220, 20, rl.Color.maroon);
            },

            .ENDING => {
                rl.drawRectangle(0, 0, screenWidth, screenHeight, rl.Color.blue);
                rl.drawText("ENDING SCREEN", 20, 20, 40, rl.Color.dark_blue);
                rl.drawText("Press ENTER or TAP to jump to ending screen", 120, 220, 20, rl.Color.dark_blue);
            },
        }
    }
}
