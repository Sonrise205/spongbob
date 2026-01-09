return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    local l_truncateNumberWithSuffix_0 = v0.truncateNumberWithSuffix;
    local l_formatNumberWithCommas_0 = v0.formatNumberWithCommas;
    local l_formatTime_0 = v0.formatTime;
    describe("truncateNumberWithSuffix", function() --[[ Line: 9 ]]
        -- upvalues: l_truncateNumberWithSuffix_0 (copy)
        it("should truncate small numbers without suffix", function() --[[ Line: 10 ]]
            -- upvalues: l_truncateNumberWithSuffix_0 (ref)
            expect(l_truncateNumberWithSuffix_0(1.234)).to.equal("1.2");
        end);
        it("should return whole numbers without suffix", function() --[[ Line: 14 ]]
            -- upvalues: l_truncateNumberWithSuffix_0 (ref)
            expect(l_truncateNumberWithSuffix_0(123)).to.equal("123");
        end);
        it("should truncate numbers in the thousands with 'K' suffix", function() --[[ Line: 18 ]]
            -- upvalues: l_truncateNumberWithSuffix_0 (ref)
            expect(l_truncateNumberWithSuffix_0(1234)).to.equal("1.2K");
        end);
        it("should truncate numbers in the hundreds of thousands with 'K' suffix", function() --[[ Line: 22 ]]
            -- upvalues: l_truncateNumberWithSuffix_0 (ref)
            expect(l_truncateNumberWithSuffix_0(123456)).to.equal("123.4K");
        end);
        it("should respect MaxDecimals when truncating numbers", function() --[[ Line: 26 ]]
            -- upvalues: l_truncateNumberWithSuffix_0 (ref)
            expect(l_truncateNumberWithSuffix_0(123456, {
                MaxDecimals = 1
            })).to.equal("123.4K");
            expect(l_truncateNumberWithSuffix_0("123456", {
                MaxDecimals = 2
            })).to.equal("123.45K");
            expect(l_truncateNumberWithSuffix_0(123456, {
                MaxDecimals = 3
            })).to.equal("123.456K");
        end);
        it("should handle large numbers with 'M' and 'B' suffixes", function() --[[ Line: 32 ]]
            -- upvalues: l_truncateNumberWithSuffix_0 (ref)
            expect(l_truncateNumberWithSuffix_0(123456789)).to.equal("123.4M");
            expect(l_truncateNumberWithSuffix_0(1234567890)).to.equal("1.2B");
        end);
        it("should add space between number and suffix if AddSpace is true", function() --[[ Line: 37 ]]
            -- upvalues: l_truncateNumberWithSuffix_0 (ref)
            expect(l_truncateNumberWithSuffix_0(1234567890, {
                AddSpace = true
            })).to.equal("1.2 B");
        end);
        it("should show trailing zeroes if ShowZeroes is true", function() --[[ Line: 41 ]]
            -- upvalues: l_truncateNumberWithSuffix_0 (ref)
            expect(l_truncateNumberWithSuffix_0(123456, {
                MaxDecimals = 3, 
                ShowZeroes = true
            })).to.equal("123.456K");
            expect(l_truncateNumberWithSuffix_0(123400, {
                MaxDecimals = 2, 
                ShowZeroes = true
            })).to.equal("123.40K");
            expect(l_truncateNumberWithSuffix_0(500000, {
                ShowZeroes = true
            })).to.equal("500.0K");
        end);
    end);
    describe("formatNumberWithCommas", function() --[[ Line: 48 ]]
        -- upvalues: l_formatNumberWithCommas_0 (copy)
        it("should format small numbers without commas", function() --[[ Line: 49 ]]
            -- upvalues: l_formatNumberWithCommas_0 (ref)
            expect(l_formatNumberWithCommas_0("12")).to.equal("12");
        end);
        it("should format numbers in the thousands with commas", function() --[[ Line: 53 ]]
            -- upvalues: l_formatNumberWithCommas_0 (ref)
            expect(l_formatNumberWithCommas_0(1234)).to.equal("1,234");
        end);
        it("should format numbers in the hundreds of thousands with commas", function() --[[ Line: 57 ]]
            -- upvalues: l_formatNumberWithCommas_0 (ref)
            expect(l_formatNumberWithCommas_0(123456)).to.equal("123,456");
        end);
        it("should format numbers in the millions with commas", function() --[[ Line: 61 ]]
            -- upvalues: l_formatNumberWithCommas_0 (ref)
            expect(l_formatNumberWithCommas_0("1234567")).to.equal("1,234,567");
        end);
        it("should format numbers with decimal places and commas", function() --[[ Line: 65 ]]
            -- upvalues: l_formatNumberWithCommas_0 (ref)
            expect(l_formatNumberWithCommas_0(12345.6789)).to.equal("12,345.6789");
        end);
    end);
    describe("formatTime", function() --[[ Line: 70 ]]
        -- upvalues: l_formatTime_0 (copy)
        it("should format time in seconds to hh:mm:ss", function() --[[ Line: 71 ]]
            -- upvalues: l_formatTime_0 (ref)
            expect(l_formatTime_0(3600, "s", "2h:2m:2s")).to.equal("01:00:00");
        end);
        it("should format time less than an hour to mm:ss", function() --[[ Line: 75 ]]
            -- upvalues: l_formatTime_0 (ref)
            expect(l_formatTime_0(125, "s", "2h:2m:2s")).to.equal("00:02:05");
        end);
        it("should format time with custom format", function() --[[ Line: 79 ]]
            -- upvalues: l_formatTime_0 (ref)
            expect(l_formatTime_0(125, "s", "1h:1m:1s")).to.equal("0:2:5");
            expect(l_formatTime_0(125, "s", "h:m:s", {})).to.equal("0:2:5");
        end);
        it("should hide parent zero values if HideParentZeroValues is true", function() --[[ Line: 84 ]]
            -- upvalues: l_formatTime_0 (ref)
            expect(l_formatTime_0(125, "s", "2h:2m:2s", {
                HideParentZeroValues = true
            })).to.equal("02:05");
            expect(l_formatTime_0(125, "s", "h:m:s:ds", {
                HideParentZeroValues = true
            })).to.equal("2:5:0");
        end);
        it("should include trailing zeroes for sub-second values", function() --[[ Line: 89 ]]
            -- upvalues: l_formatTime_0 (ref)
            expect(l_formatTime_0(125, "s", "h:m:s:ds")).to.equal("0:2:5:0");
        end);
        it("should format large number of seconds to h:s", function() --[[ Line: 93 ]]
            -- upvalues: l_formatTime_0 (ref)
            expect(l_formatTime_0(3725, "s", "h:s")).to.equal("1:125");
        end);
        it("should format milliseconds to seconds", function() --[[ Line: 97 ]]
            -- upvalues: l_formatTime_0 (ref)
            expect(l_formatTime_0(1000, "ms", "s")).to.equal("1");
        end);
    end);
end;