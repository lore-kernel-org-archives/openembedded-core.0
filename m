Return-Path: <pb@pbcl.net>
Received: from mail.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 382A56C149
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 13:50:50 +0000 (UTC)
Received: from [2a00:c60:0:cb01:c42b:17d7:323e:6be8] (helo=phil-desktop)
	by mail.pbcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89) (envelope-from <pb@pbcl.net>)
	id 1grNbF-0000oi-38; Wed, 06 Feb 2019 14:50:50 +0100
Message-ID: <11625b035a373f6bbf1eab211cf4c4ed1277e69d.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 06 Feb 2019 13:50:46 +0000
In-Reply-To: <3e0560e858598be43db31dac6ff4d8ff6f88d768.camel@linuxfoundation.org>
References: <a8f5b5c4bf1d9004c564500f7b6f1fd3da1715b1.camel@pbcl.net>
	<3e0560e858598be43db31dac6ff4d8ff6f88d768.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] go, go-common: Add missing quotes in shell variable assignment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2019 13:50:50 -0000
Content-Type: multipart/alternative; boundary="=-yQ/Ov8mkjyAvM4pI440y"

--=-yQ/Ov8mkjyAvM4pI440y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-01 at 10:20 +0000, Richard Purdie wrote:
> > go tool dist: cannot invoke C compiler "gcc ": exec: "gcc ": executable file not found in $PATH

Oh, huh, I guess this is an example of getting the (approximately)
right result for the wrong reasons.  I'll have to think about that some
more then.  Thanks.

p.


--=-yQ/Ov8mkjyAvM4pI440y
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Fri, 2019-02-01 at 10:20 +0000, Richard Purdie wrote:</div><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex=
; border-left:2px #729fcf solid;padding-left:1ex"><pre>go tool dist: cannot=
 invoke C compiler "gcc ": exec: "gcc ": executable file not found in $PATH=
</pre></blockquote></blockquote><div><br></div><div>Oh, huh, I guess this i=
s an example of getting the (approximately) right result for the wrong reas=
ons.  I'll have to think about that some more then.  Thanks.</div><div><br>=
</div><div>p.</div><div><br></div></body></html>

--=-yQ/Ov8mkjyAvM4pI440y--
