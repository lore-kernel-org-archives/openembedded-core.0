Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REoiT-0000Ms-Do
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 22:50:53 +0200
Received: by gyc15 with SMTP id 15so1491632gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=uuiEyumk6ZKel96pJgE91ZR6aSebFg9G76mjX+AM/Cw=;
	b=W/MGiBZpZmiGqdRqeRMWO07L8XGTphB69HzZIPjJWPXYYbwSnvprbC0+E39SACgH6/
	sy7aBZ0EGq3hm6wx++aPBI+vhiZEbl/CZgnRV50P7Jl8qNM5R6wBq/dPweU0+yRwqybZ
	X6s24DDOjB0K13krG+tyPJra9J96AS7R2Xps8=
Received: by 10.68.17.193 with SMTP id q1mr18829517pbd.98.1318625107088; Fri,
	14 Oct 2011 13:45:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 14 Oct 2011 13:44:37 -0700 (PDT)
In-Reply-To: <20111014084032.GD3542@jama.jama.net>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<3ffacbd5138165278774387c51b4bd3bb625eaff.1317648041.git.Martin.Jansa@gmail.com>
	<1317654131.13337.6.camel@phil-desktop>
	<20111003150904.GR7364@jama.jama.net>
	<1318535180.3158.4.camel@lenovo.internal.reciva.com>
	<CAMKF1spsGP=k24dbbX+p4dQLncBcaP5BX6Qf0S4ZrcttnfqSGw@mail.gmail.com>
	<20111014084032.GD3542@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2011 13:44:37 -0700
Message-ID: <CAMKF1sp51aG9v_JSDpW1f4PVJtx-sNRRevnec_hOtiX48KzdZw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 26/30] glx-use-tls: add from meta-oe layer
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
X-List-Received-Date: Fri, 14 Oct 2011 20:50:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 14, 2011 at 1:40 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I'm not using uclibc at all, but if you're 100% sure, then I'll send
> patch removing glx-use-tls.inc after the rest of Xorg patchset is
> applied and mesa removed from meta-oe..
>

100%

> Regards,
>


