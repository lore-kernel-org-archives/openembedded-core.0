Return-Path: <twoerner@gmail.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8DF79F19
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 02:27:45 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id q186-v6so418668ljb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 19:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OB6AVYbneTXXhfuNFlHSisnHONKjgmuzVNR3FiHsZoU=;
	b=TT4r7ydg8JuLvKmfmKzvrpnrZjC4cDjLtZl7WvCJBqKTJZkJ9ZGQKxgFZ9GH1ZwEKQ
	3YbajvtEMiMHPY9+lfaAe3DBE8s8TVKajzUFHEj6SYVKe4eWRCpQwDGbeSWRY7061Omp
	To1vgUwsl0t4B9vpL8BYMkz9eDXljd2Jt/IhEHt3ltAF6i7laOM4vbPgpAZJAD+bAfy5
	wYeEvoafy8kkYY6lFWNdguZfjDXKBMylhwMLdtX35sfxyTSzW6eEg88+hvVVpk3IHW1t
	ClRcYvmr+bKzMm5LkGv2LMv2s8ROrjFjB3VQihdN4TJ9PZ7t9fuz3t3hhARR62RxNLQ5
	JATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OB6AVYbneTXXhfuNFlHSisnHONKjgmuzVNR3FiHsZoU=;
	b=hRO1V2vU0majRRaUvEPQzdxDSn8VMyGT3Dw5IG3B62uFxEM05xKkgogxGJR49nyTw6
	Z8p8ThMIAA16Ts6EYzKPRaLKdLap8WuQORC+2IPb0ST9Abc3stpObcdgBmh8GN3vh8EH
	N4GST0+F8uXPZBwPEqlM3MtogTGBvq9anm7yFEugs0WadTvxhqlwe4jWhsEdkk/rUOMj
	20bFXEyFujffFw4u3GBSR40GDLEOtBfiIbetgkI7FGfBvxqIDTwdPnnNKd/+7aQ/C+0s
	vjWagoBPTnxWAwRN6HMRoyiZ9YoXbOP3GZA8uOc/NjqnDa4JU88jZcEi78RL/BrVC0cJ
	pXkw==
X-Gm-Message-State: AGRZ1gKB6D6s5vMlI8Dl5moZIHo2Sbit4O0bX4+5cEYY+xgEoUonchk5
	lOjbM89TDxnDsLn3h4zv7ccs45y7uXBvAaG9bqx9Rw==
X-Google-Smtp-Source: AJdET5eiaAVw66d1MlfdLiQixZWjncdfL/uMviBYTBsRimvedd14ZqKz4+vgeK3Kt8x5v0ZdovAKfTE8LsXRX3LFkh4=
X-Received: by 2002:a2e:63cd:: with SMTP id
	s74-v6mr6159137lje.117.1541125665794; 
	Thu, 01 Nov 2018 19:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181101140417.GA12376@linux-uys3>
	<CAPoiz9y_prstnR5dsxHNwSk81ShLmkybEXySEESTgZrpgKXMcA@mail.gmail.com>
In-Reply-To: <CAPoiz9y_prstnR5dsxHNwSk81ShLmkybEXySEESTgZrpgKXMcA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 1 Nov 2018 22:27:32 -0400
Message-ID: <CAHUNapRrWkAGahwLgEzfbPSi2UhQCTqMSGQOAEp2Dxpi3MwRPA@mail.gmail.com>
To: jdmason@kudzu.us
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	yocto-advocacy@yoctoproject.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OEDAM @ SCaLE 2019
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
X-List-Received-Date: Fri, 02 Nov 2018 02:27:45 -0000
Content-Type: multipart/alternative; boundary="000000000000dd30af0579a54757"

--000000000000dd30af0579a54757
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

On Thu, Nov 1, 2018 at 3:56 PM Jon Mason <jdmason@kudzu.us> wrote:

> I am planning on being at SCaLE (assuming the OEDEM happens there).
>
> Many corporate travel budgets are tied to presenting at conferences.
> So, if we could somehow get a track there (which might be too late in
> the game to do now), then we might be able to get enough people
> present to make it happen and pull in others whose budget is more
> flexible.
>

As it turns out, I'll be organising the YP/OE Miniconf that will most
likely be run on the Sunday. I was going to send out a separate email
discussing the Miniconf, but I guess now is as good a time as any :-)

While it's true that the CFP has closed for SCaLE, I plan to open my own
CFP specifically for the Miniconf, and I don't plan to close it until
closer to the conference itself. I want to encourage people to give talks
about current things, as such, having a CFP close this early wouldn't do.

We haven't decided on a format for the Miniconf, exactly, if we have
traditional talks, we'll have 6 sessions (2 before lunch, 4 after). But
depending on interest and what sort of proposals we get, we might do some
longer, some shorter talks.

 I hope this helps. Best regards,
    Trevor

--000000000000dd30af0579a54757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jon,<br><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Thu, Nov 1, 2018 at 3:56 PM Jon Mason &lt;<a href=3D"mailto:jdmason@kud=
zu.us">jdmason@kudzu.us</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">I am planning on being at SCaLE (assuming the OEDEM happens there).<br>
<br>
Many corporate travel budgets are tied to presenting at conferences.<br>
So, if we could somehow get a track there (which might be too late in<br>
the game to do now), then we might be able to get enough people<br>
present to make it happen and pull in others whose budget is more<br>
flexible.<br></blockquote><div><br></div><div>As it turns out, I&#39;ll be =
organising the YP/OE Miniconf that will most likely be run on the Sunday. I=
 was going to send out a separate email discussing the Miniconf, but I gues=
s now is as good a time as any :-)</div><div><br></div><div>While it&#39;s =
true that the CFP has closed for SCaLE, I plan to open my own CFP specifica=
lly for the Miniconf, and I don&#39;t plan to close it until closer to the =
conference itself. I want to encourage people to give talks about current t=
hings, as such, having a CFP close this early wouldn&#39;t do.</div><div><b=
r></div><div>We haven&#39;t decided on a format for the Miniconf, exactly, =
if we have traditional talks, we&#39;ll have 6 sessions (2 before lunch, 4 =
after). But depending on interest and what sort of proposals we get, we mig=
ht do some longer, some shorter talks.</div><div><br></div><div>=C2=A0I hop=
e this helps. Best regards,</div><div>=C2=A0 =C2=A0 Trevor</div></div></div=
>

--000000000000dd30af0579a54757--
