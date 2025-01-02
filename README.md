# Mythix
Online Multiplayer game

## Build for web

- First have to setup emsdk and source the emsdk_env.sh file
- Then, Compile
```bash
zig build -Dtarget=wasm32-emscripten --sysroot ./emsdk/upstream/emscripten
```

## Local build
```bash
zig build
```
