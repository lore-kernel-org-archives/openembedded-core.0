Return-Path: <ka6sox@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCF3748A0;
	Tue, 22 May 2018 16:24:17 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f6-v6so1345205wmc.4;
	Tue, 22 May 2018 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T7wFWF0h4vl1NIt88TO/qIo563Oj7a1EsqbkXWa4lJY=;
	b=avZgYwJeO8M9n+7M46ifgr+VEofYBk8u8XaOTdmmtsULbG8vQmIBExoIpeTADNQlCl
	AWDlVGhcsjShSIGemjSbNu+muUGigMzIA7V33OT9MUpYZYJ6uKOEKfMLNzFMzzJJf3B6
	es0jLzynwPwIA4pCjZPe6ZoLpmIEqZDQmcGHCf8yHaGHHbQ58yE9UZK/da109aEAPszS
	DlTeCO5bD760nwGrdd2Uz/OywppFUiYABtse/oj23hAHZWz7fwERkJbLQW+AVN+/W73i
	zFD1VlT+DSmDhcaKwi/zQJ8YyFTeJmeuQfaoCTFXgjNde3hd4MRbweAQLgkg0JBRgYE/
	S65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T7wFWF0h4vl1NIt88TO/qIo563Oj7a1EsqbkXWa4lJY=;
	b=DzT2m2twEnPK3N3HqLT3K3pU973kuXfEzFGNTqyxBh4TO44IA0sK0jPL8lwctmhUl5
	Z83BGN0ui09662z+PrOQvBI4YWudEtSRkO3nXVnMZ4wfHO6ezB8/VOtRUI0WSsaUIOuz
	m8tsVZld26mf/oD+sWLawuBHSIwFOv0H/LTnVC8/D1gxy2WoxcByZrS74HTeVYZSvYVT
	xtHz9MWNBeRWjS0XhnDGmGBxAnSqH4wdN35PiuVPLCrTovbSoqNooEJ59n/bagjalVzW
	r1+ujNyaX5bxHC+/rlfSht5d4xQgUWHHzESfIDi7rixk4FE/ouLO0tW69C812eiO71R2
	6QFw==
X-Gm-Message-State: ALKqPweV21J6J3ZRIFVkDU7/tC2lfc1h8VBfQycVhKMVxjV4UMdi4g6a
	lDIagUAqJ4S1it0AHU3mGU9fGwl4Gyc2tGxl6Ak=
X-Google-Smtp-Source: AB8JxZrasXv5/w3NttpIzxrkp2NtghmTF/oIRz1rSoDXphTzxLH+sAs7/jUe/nHvyudy/A9Qn8JBadawjnFtif9+NXM=
X-Received: by 2002:a2e:4185:: with SMTP id
	d5-v6mr15031615ljf.114.1527006257825; 
	Tue, 22 May 2018 09:24:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:a087:0:0:0:0:0 with HTTP; Tue, 22 May 2018 09:23:57
	-0700 (PDT)
In-Reply-To: <CA+chaQe-1BaJFNARyK4wBh-vSmC=HqpcLHj=i_tHMrq-sa0x1A@mail.gmail.com>
References: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
	<CA+chaQe-1BaJFNARyK4wBh-vSmC=HqpcLHj=i_tHMrq-sa0x1A@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
Date: Tue, 22 May 2018 09:23:57 -0700
Message-ID: <CAHQecY7dqvOTOFKTeGpKc0Dfp2eNwpsM44w0Xjp_Has4ziYnsg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-openembedded maintainer ship change.
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
X-List-Received-Date: Tue, 22 May 2018 16:24:18 -0000
Content-Type: multipart/alternative; boundary="000000000000914c53056ccdd971"

--000000000000914c53056ccdd971
Content-Type: text/plain; charset="UTF-8"

Thanks Armin and Khem!

On Tue, May 22, 2018 at 9:14 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Thanks Armin and Khem!
>
> On Tue, May 22, 2018 at 5:41 PM akuster808 <akuster808@gmail.com> wrote:
>
>> Hello all,
>>
>> After much thought, I have decided to step away from being the
>> meta-openembedded maintainer, patch wrangler and builder.  Khem Raj has
>> kindly stepped up to continue these activities. Maintaining this was
>> consuming too much of my free time and I need to focus on other things
>> in the community.
>>
>> Thanks for the opportunity to have served you.
>>
>> Kind regards,
>>
>> Armin
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--000000000000914c53056ccdd971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Armin and Khem!</div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Tue, May 22, 2018 at 9:14 AM, Martin Jansa <=
span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr">Thanks Armin and Khem!</div><div class=3D"HOEnZb=
"><div class=3D"h5"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue,=
 May 22, 2018 at 5:41 PM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.=
com" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Hello all,<br>
<br>
After much thought, I have decided to step away from being the<br>
meta-openembedded maintainer, patch wrangler and builder.=C2=A0 Khem Raj ha=
s<br>
kindly stepped up to continue these activities. Maintaining this was<br>
consuming too much of my free time and I need to focus on other things<br>
in the community.<br>
<br>
Thanks for the opportunity to have served you.<br>
<br>
Kind regards,<br>
<br>
Armin<br>
<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div>
</div></div><br>-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--000000000000914c53056ccdd971--
