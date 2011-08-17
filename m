Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QtVgW-00023G-3r
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 04:16:48 +0200
Received: by eyb7 with SMTP id 7so384098eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 19:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=9/qgDNaAF5UIaidlIyiUUDAvRDCsfpX6cjSkOcg76Hs=;
	b=il1PO1p0gr4YXRxYgIpDKOOBG0r+qBrMEyzWB+sP/TvHWmSf65h+8JSirhnQHi+8J7
	YWqK1dDFUr8BKzPMUAnR9UF55B9qx7huRpTHpdCagLLAHLnMNh5gT9auRDhajz7ILq2I
	SIOuypFxJZt4A4g/JduCGO2k9Vvn1vhbNq2YQ=
MIME-Version: 1.0
Received: by 10.213.26.219 with SMTP id f27mr1069691ebc.76.1313547129996; Tue,
	16 Aug 2011 19:12:09 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Tue, 16 Aug 2011 19:12:09 -0700 (PDT)
In-Reply-To: <FA0B50F8-A4DD-4C28-9FCB-EB4F63486087@ti.com>
References: <1313525796-21604-1-git-send-email-agnel.joel@gmail.com>
	<23CB1EF8-9ACB-4F95-BE6A-F084E515837A@beagleboard.org>
	<CAMKF1spbd4NEHoP-aRk6qorPLR079F33JwH8c7BOZpwOwcBRZg@mail.gmail.com>
	<CAD=GYpbY-DYM77_JV_-8fL2eKKj5Nk1yKp2sL5EErfUdQLq5Qg@mail.gmail.com>
	<FA0B50F8-A4DD-4C28-9FCB-EB4F63486087@ti.com>
Date: Tue, 16 Aug 2011 21:12:09 -0500
Message-ID: <CAD=GYpbqB0RzfOoKAfFaPmJgPmTyExHpBUqFEBQE2sz-KH1eBQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Cc: "Kooi, Koen" <k-kooi@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] angstrom-task-gnome: Added gedit to task-gnome dependencies
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
X-List-Received-Date: Wed, 17 Aug 2011 02:16:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sorry to bother you but are you sure?

"if this is a patch against angstrom on top of oe.dev then it should go
to oe-devel list too"

meta-angstrom patches are not ontop of oe.dev

On Tue, Aug 16, 2011 at 8:16 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
> He meant angstrom-devel and/or oe-devel, =A0not oe-core.
>
> Denys
>
>
> ----- Reply message -----
> From: "Joel A Fernandes" <agnel.joel@gmail.com>
> To: "Khem Raj" <raj.khem@gmail.com>
> Cc: "Patches and discussions about the oe-core layer"
> <openembedded-core@lists.openembedded.org>, "Kooi, Koen" <k-kooi@ti.com>,
> "Dmytriyenko, Denys" <denys@ti.com>
> Subject: [OE-core] [PATCH] angstrom-task-gnome: Added gedit to task-gnome
> dependencies
> Date: Tue, Aug 16, 2011 18:07
>
>
>
> On Tue, Aug 16, 2011 at 6:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Aug 16, 2011 at 2:24 PM, Jason Kridner <jkridner@beagleboard.org=
>
>> wrote:
>>> I see the README says this should be on the OE-core list, but maybe thi=
s
>>> should go on the Angstrom list?
>>>
>>
>> it should go to angstrom-devel list in anycase
>> if this is a patch against angstrom on top of oe.dev then it should go
>> to oe-devel list too. oe-core is not needed
>
> Hi Khem, just confirming that you mean meta-angstrom patches should go
> to both oe-core and angstrom lists?
>
> Thanks,
> Joel
>


