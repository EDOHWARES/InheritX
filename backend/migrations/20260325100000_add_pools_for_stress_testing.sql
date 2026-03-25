-- Migration to add pools table for liquidity and stress testing
CREATE TABLE IF NOT EXISTS pools (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    asset_code VARCHAR(50) UNIQUE NOT NULL,
    total_liquidity DECIMAL(20, 8) NOT NULL DEFAULT 0,
    utilized_liquidity DECIMAL(20, 8) NOT NULL DEFAULT 0,
    last_drain_simulation_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Initial default pools
INSERT INTO pools (asset_code, total_liquidity, utilized_liquidity)
VALUES ('USDC', 1000000.0, 150000.0), ('XLM', 500000.0, 50000.0)
ON CONFLICT (asset_code) DO NOTHING;
