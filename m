Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SA1rP-0007Ag-H6 for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 17:24:35 +0100
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3VBzlN72XFz3hhxJ;
	Tue, 20 Mar 2012 17:15:44 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3VBzlP17XXz4KK3D;
	Tue, 20 Mar 2012 17:15:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id 9MYp-+z0Ps7g; Tue, 20 Mar 2012 17:15:44 +0100 (CET)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Tue, 20 Mar 2012 17:15:44 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 4DF961A6535;
	Tue, 20 Mar 2012 17:15:44 +0100 (CET)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 343F6202A50;
	Tue, 20 Mar 2012 17:15:44 +0100 (CET)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Henning Heinold <heinold@inf.fu-berlin.de>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20120320140310.GA14747@rhein.zuhause.netz>
References: <20120319215934.5336A206060@gemini.denx.de>
	<20120320004345.GG15554@denix.org>
	<20120320113348.D4362202A50@gemini.denx.de>
	<20120320140310.GA14747@rhein.zuhause.netz>
Comments: In-reply-to Henning Heinold <heinold@inf.fu-berlin.de>
	message dated "Tue, 20 Mar 2012 15:03:12 +0100."
Date: Tue, 20 Mar 2012 17:15:44 +0100
Message-Id: <20120320161544.343F6202A50@gemini.denx.de>
Subject: Re: specific version dependenciews - was: Linking two recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2012 16:24:35 -0000
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear Henning,

In message <20120320140310.GA14747@rhein.zuhause.netz> you wrote:
>
> we do not support version bounding in the recipes directly. You might h=
ave to
> go with the PREFFRED_VERSION prefix for the recipes in the machine file=
.

Thanks!


Best regards,

Wolfgang Denk

--=20
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
You got to learn three things. What's  real,  what's  not  real,  and
what's the difference."           - Terry Pratchett, _Witches Abroad_


