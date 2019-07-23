brew install node
npm install --global pnpm

NPMS=(
    degit
    now
    spoof
    surge
    speed-test
)
pnpm install --global $NPMS