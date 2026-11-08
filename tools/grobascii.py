"""Print 8-bit grayscale PNGs (firmware/images) as text: # dark, . light,
? gray (row padding), with column numbers above.

    python tools/grobascii.py firmware/images/F50DC-packed.png ...
"""
import sys, zlib, struct
def load(p):
    d=open(p,'rb').read(); i=8; idat=b''
    while i<len(d):
        n,t=struct.unpack('>I4s',d[i:i+8]); c=d[i+8:i+8+n]
        if t==b'IHDR': w,h,bd,ct=struct.unpack('>IIBB',c[:10])
        if t==b'IDAT': idat+=c
        i+=12+n
    raw=zlib.decompress(idat); bpp=1; stride=w*bpp; rows=[]; prev=bytearray(stride); p=0
    for y in range(h):
        f=raw[p]; line=bytearray(raw[p+1:p+1+stride]); p+=1+stride
        for x in range(stride):
            a=line[x-bpp] if x>=bpp else 0; b=prev[x]; c=prev[x-bpp] if x>=bpp else 0
            if f==1: line[x]=(line[x]+a)&255
            elif f==2: line[x]=(line[x]+b)&255
            elif f==3: line[x]=(line[x]+(a+b)//2)&255
            elif f==4:
                pp=a+b-c; pa,pb,pc=abs(pp-a),abs(pp-b),abs(pp-c)
                pr=a if pa<=pb and pa<=pc else (b if pb<=pc else c)
                line[x]=(line[x]+pr)&255
        rows.append(line); prev=line
    return rows
for p in sys.argv[1:]:
    rows=load(p); w=len(rows[0])
    print(p, w, len(rows))
    print('    '+''.join(str(x//10%10) if x%10==0 else ' ' for x in range(w)))
    print('    '+''.join(str(x%10) for x in range(w)))
    for y,r in enumerate(rows): print(f'{y:3} '+''.join('#' if v==0 else ('.' if v==255 else '?') for v in r))
