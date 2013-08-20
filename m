Return-Path: <andre.draszik@linaro.org>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id E59186B6AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 22:54:31 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so781284lab.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 15:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=6G0i+FOAwS/XcccuhiHeJCRahsrfn0Sq24ZIDWIdDXE=;
	b=CchJG9BiNNMSC55oft8GNNDBkub4AxX5J8jecw7MzKrnD6JpTaAyQKN7y7O+4vzY3D
	tGC2M87GtLdtnTM9hi5/OOu/Uaj6hZIxqpQHkNgQfD2BPDgg4p0kKmqAwi3UFtrbGI0e
	78xu8cVQelahyDHnuzipSjYf4JWsRfeTQ3J7qLit9TE/wweggvgTko4HkPxOHch2l0zj
	wBdZ5A4lbbb0jix0NyOiEgLbvDaUha4pg4hBQcXIwLxhFzw13+okVPPnGJauGk9ySRHB
	doiSendYcRBk1K6LUik+LPqt5V7aSsZtUfUFw/DU2rOZKOKhD0gH9gKFahMvUK9RPUVm
	iaTA==
X-Gm-Message-State: ALoCoQkg3Rul7vMj1VPrmqIdF8nS61mx1PLwqZYmcNk67iPQuY/hndsNjJTW1g7LqLG+yknnSr4/
MIME-Version: 1.0
X-Received: by 10.112.210.136 with SMTP id mu8mr4479452lbc.25.1377039271237;
	Tue, 20 Aug 2013 15:54:31 -0700 (PDT)
Received: by 10.112.162.133 with HTTP; Tue, 20 Aug 2013 15:54:31 -0700 (PDT)
Received: by 10.112.162.133 with HTTP; Tue, 20 Aug 2013 15:54:31 -0700 (PDT)
In-Reply-To: <1376939864-4790-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1376939864-4790-1-git-send-email-lauren.post@freescale.com>
Date: Tue, 20 Aug 2013 23:54:31 +0100
Message-ID: <CAPaOLoLiT_0Z3xbvHYwpKEiN5KmmoQ-=rknNEFAUeXzkmUaLqg@mail.gmail.com>
From: Andre Draszik <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [v2][PATCH 1/2] directfb: Upgrade to 1.6.3
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
X-List-Received-Date: Tue, 20 Aug 2013 22:54:33 -0000
Content-Type: multipart/alternative; boundary=001a11c3c7049aaa7504e468f00e

--001a11c3c7049aaa7504e468f00e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On 19 Aug 2013 20:24, "Lauren Post" <lauren.post@freescale.com> wrote:
>
> directfb: Upgrade to 1.6.3
>
> [...]
>  delete mode 100644 meta/recipes-graphics/directfb/directfb_1.6.1.bb
>  create mode 100755 meta/recipes-graphics/directfb/directfb_1.6.3.bb

Not sure you really wanted the mode change.

Cheers,
Andr=E9

--001a11c3c7049aaa7504e468f00e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi,<br></p>
<p dir=3D"ltr">On 19 Aug 2013 20:24, &quot;Lauren Post&quot; &lt;<a href=3D=
"mailto:lauren.post@freescale.com">lauren.post@freescale.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; directfb: Upgrade to 1.6.3<br>
&gt;<br>
&gt; [...]<br>
&gt; =A0delete mode 100644 meta/recipes-graphics/directfb/<a href=3D"http:/=
/directfb_1.6.1.bb">directfb_1.6.1.bb</a><br>
&gt; =A0create mode 100755 meta/recipes-graphics/directfb/<a href=3D"http:/=
/directfb_1.6.3.bb">directfb_1.6.3.bb</a></p>
<p dir=3D"ltr">Not sure you really wanted the mode change.</p>
<p dir=3D"ltr">Cheers,<br>
Andr=E9</p>

--001a11c3c7049aaa7504e468f00e--
