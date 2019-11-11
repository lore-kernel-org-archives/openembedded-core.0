Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CDF0D7D2AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:43:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47BSCc30Chz3L
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 11:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573469020;
	bh=NemkBb4ndLjn4U/XIxH9+60Bzj77B1+q7/ebIF1wTSo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=sCk8yV15Ox37ZuRLBByvESZgaiYNLrwAF8B5lTJ2iJ8n1/lkbUAn0vrexc6TK4yYV
	OhANz5KAL2Rrw+dN6zLRagM6U4u/0/+jl43dvV+JEVuLriwCY06NzV6PiEXZCMPdXR
	xQsy+BfwtOAaMlDbdwvpqKnMqIvoGP2IItoX9aIXHKxAysfa588vrmtLiz2O3BerpU
	4U4kVYJoWCDH+8bTAVVPlM2Z5JS+HqAfrqcXbxcS6qBoLAlUxb5Ek4Y53gKH27AV6b
	8jNLsJFpHnF+QqdswA6LkO+cECQ0fAQ8icfhdpZTlXgZ8m//9gzEScyygEXRZjWaSO
	yhErlD868BDU63zQ5qD4Dk0CMqdmbfNGjj1FZOslZgzZ1Nopk85hRqbgqGL3XJ9tv7
	s76vtIn5HROurw+Z955JELfor473Ms/1Hdu2r5TQgBEkzWzeeJjLn4OOw9vjfT2Wza
	iCwbevz/BhGRGDZgCB1yp0tAmsBCNG3EYFkPEnAjC2TIZ/EkDHREvGpXX/Eg7el2T6
	SXDn/C0PU2j54ZoPv+GyFXphg1/E4zCU5+HqvqETR/qF2aw3s51PNPMgSLMWRiUzow
	nfvUg3YtBsKl5yuqJ+AkBacdtitXhmZxgXTyfbJ/UodnVifFNGh5bbG4RcWz+sFu5M
	tFAJ0Am14Is3gxI4mCX6ddRc=
Date: Mon, 11 Nov 2019 12:43:38 +0200
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20191111104338.GC28797@localhost>
References: <20191104205504.24428-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20191104205504.24428-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [PATCH] iputils: Whitelist CVE-2000-1213 CVE-2000-1214
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
X-List-Received-Date: Mon, 11 Nov 2019 10:43:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

ping


Thanks
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


