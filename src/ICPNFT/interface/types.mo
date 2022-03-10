import Time "mo:base/Time";
import TrieSet "mo:base/TrieSet";

module {
    public type NFTMetadata = {
        logo: Text;
        name: Text;
        symbol: Text;
        desc: Text;
        totalSupply: Nat;
    };
    public type Location = {
        #InCanister: Blob; 
        #AssetCanister: (Principal, Blob);
        #IPFS: Text;
        #Web: Text;
    };
    public type Attribute = {
        key: Text;
        value: Text;
    };
    public type TokenMetadata = {
        filetype: Text;
        location: Location;
        attributes: [Attribute];
    };
    public type TokenInfo = {
        index: Nat;
        var owner: Principal;
        var user: Principal; // this token's right to use
        var metadata: ?TokenMetadata;
        var operator: ?Principal;
        timestamp: Time.Time;
    };

    public type UserInfo = {
        var operators: TrieSet.Set<Principal>;  
        var allowedBy: TrieSet.Set<Principal>;     
        var allowedTokens: TrieSet.Set<Nat>;       
        var tokens: TrieSet.Set<Nat>;              
    };

    public type Error = {
        #Unauthorized;
        #TokenNotExist;
        #InvalidSpender;
    };
}