# Ada-fair-share
Fair-Share Scheduling algorithms in Ada

## Overview

This repository implements three fair-share scheduling algorithms:
1. **Traditional Unix FSS** - Adjusts priorities based on CPU usage decay
2. **Completely Fair Scheduler (CFS)** - Proportional share via Virtual Runtime
3. **Lottery Scheduling** - Probabilistic ticket-based distribution

## Building and Running

### Prerequisites
- GNAT Ada compiler (part of GCC)
- gprbuild (GNAT Project Manager)

On Ubuntu/Debian:
```bash
sudo apt-get install gnat gprbuild
```

### Quick Start

To build and run the demo:
```bash
make
```

This will:
1. Compile the code
2. Run the demo program showing the scheduler in action

### Running Tests

To compile and run the comprehensive test suite (15 tests):
```bash
make test
```

Or manually:
```bash
make clean
make build
./tests
```

### Available Commands

```bash
make        # Build and run demo
make build   # Build both demo and tests
make run     # Run the demo
make test    # Run the test suite
make clean   # Clean build artifacts
```

## Test Suite

The test suite (`tests.adb`) contains 15 tests covering:

### Basic Functionality (Tests 1-6)
1. Scheduler initialization
2. Adding users
3. Adding processes
4. Select next process with no processes (returns null)
5. Select next process with active processes (returns valid ID)
6. Remove process functionality

### Traditional Unix FSS (Tests 7-8)
7. CPU usage increases with ticks
8. Decay reduces CPU usage

### Completely Fair Scheduler (Tests 9-10, 13)
9. Virtual runtime increases with ticks
10. Selects process with lowest virtual runtime
13. Fair distribution between multiple users

### Lottery Scheduling (Tests 11-12)
11. All processes get selected eventually
12. Higher share users get selected proportionally more

### Edge Cases (Tests 14-15)
14. Maximum processes limit handling
15. Maximum users limit handling

Each test verifies a specific assumption about the scheduler's behavior and can be proven false if the implementation is incorrect.

## Project Structure

- `fair_share_scheduler.ads` - Package specification (types and interfaces)
- `fair_share_scheduler.adb` - Package body (algorithm implementations)
- `main.adb` - Demo program
- `tests.adb` - Comprehensive test suite
- `fair_share.gpr` - GNAT project file for demo
- `tests.gpr` - GNAT project file for tests
- `Makefile` - Build automation
