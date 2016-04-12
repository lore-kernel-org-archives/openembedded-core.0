Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 87FE6601F6;
	Tue, 12 Apr 2016 03:26:14 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id bg3so3574479obb.1;
	Mon, 11 Apr 2016 20:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5Y/7pbE6IowKb7Woo57++Iwf2A6MuJQgc+mMb6zFVRg=;
	b=dJBkLp15oF3Zgva/nKsDDssDl/SdiTczr0fwIdbZjkLjGtW+MN/IdFZ7r5lv0UkUOa
	71BEfbEtn9PS2xRLdA3vpcFDJah5YNX9ezuctX/W/Ef6LXLs2qxRu/6vBt5QxU0dhyfd
	9WAXI1EHxuyF/Q+OzA2AZraEuI7EaunzWeYkhr0UaG4uG6/2M33RmF0e51nxrqq6UiQ1
	fyyAM/cJMSjCJFTa9r8pCnsaOe9G0FfWTwPBBizMvUC2LaJlbKrV0a0Te32i9t/ReYW4
	Q689wS5VQMBXJTGGJkx914xjYbbQuuEagju488mzUuQQuNTT2ljXzAmLs+bUcc5qoL5R
	pGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5Y/7pbE6IowKb7Woo57++Iwf2A6MuJQgc+mMb6zFVRg=;
	b=j0p4pB07wd/ROMS/6pzq10RtP0/A8BrQ+5+7oK4LmTyzvtwWAJSJAF+7I5cBKrJYwK
	n/APhtBzrBcsP/gyIiN2IiQ7dpedYH3w87QitamriJiKUo2NJrfEDKNvzBV8ChXyjwVd
	Raz9GSERYoD6jW13O1REFe25c562DqCqqqeKzMouUdssRyZ8V13Biu2/s82gV+fPXvXG
	28LaX3y17ZCxVszLScjIMTtlaKVvnyTj5XMjMllH5g6kDgJ6MzZsCQvlwXyjVNMZcD7L
	IUW1kWAEYr0LY1cENftEUqnlegb41jR5dwAhqwENrSj8e8RChwNh2d6DWIf7HGPhJFMM
	03vg==
X-Gm-Message-State: AOPr4FWVm8LsEGI5S2fOilrqA+Sbh6udNUlhikj5/X5+8raJeL0g6vo34nm/P03vpwbnGlsSydhZz1KHExdgnA==
X-Received: by 10.182.255.197 with SMTP id as5mr421911obd.86.1460431574834;
	Mon, 11 Apr 2016 20:26:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.227.131 with HTTP; Mon, 11 Apr 2016 20:25:55 -0700 (PDT)
In-Reply-To: <CAHQecY4PBZ-PHi6SefradTq5o2PXKo0wbo-jid80hMc0bfkYgA@mail.gmail.com>
References: <56DEF97F.9070306@balister.org> <1458767514382.89578@seescan.com>
	<56F30D13.6030909@balister.org>
	<2408177.Nm4BLto1dd@rjs-zotac.streifs.net>
	<20160412013543.GV16135@denix.org> <570C52DB.6060901@balister.org>
	<CAHQecY4PBZ-PHi6SefradTq5o2PXKo0wbo-jid80hMc0bfkYgA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 12 Apr 2016 15:25:55 +1200
Message-ID: <CADySD0E3cJ93=QnDjdiXGQZFcKDp6kyzV1a+4A3v4VsegxZmog@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
Subject: Re: [oe] [yocto] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Tue, 12 Apr 2016 03:26:15 -0000
Content-Type: multipart/alternative; boundary=001a1134a9163ca52605304139ea

--001a1134a9163ca52605304139ea
Content-Type: text/plain; charset=UTF-8

Hi,

Is there any information/material posted online for people who weren't able
to attend because of geographical barriers ?

regards
Ankur

On Tue, Apr 12, 2016 at 1:48 PM, Tom King <ka6sox@gmail.com> wrote:

> do we have meeting minutes posted someplace?
>
> thanks
>
> tom
>
> On Mon, Apr 11, 2016 at 6:43 PM, Philip Balister <philip@balister.org>
> wrote:
>
> > On 04/11/2016 09:35 PM, Denys Dmytriyenko wrote:
> > > On Mon, Apr 11, 2016 at 03:35:21PM -0700, Rudolf J Streif wrote:
> > >> Hello Everyone:
> > >>
> > >> If you attended OEDAM last Friday in San Diego, I very much hope that
> > you enjoyed being here.
> > >>
> > >> The Catamaran Hotel, where we held the meeting, would very much
> > appreciate your feedback:
> > >>
> > >> www.catamaranresort.com/trip
> > >>
> > >> I hope you all had a safe trip back home,
> > >
> > > And huge thanks to Rudi and Jefro for their help in organizing the
> event!
> > >
> >
> > And an even bigger thanks to everyone that came to the meeting. You are
> > the people that make OpenEmbedded great!
> >
> > Philip
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--001a1134a9163ca52605304139ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Is there any information=
/material posted online for people who weren&#39;t able to attend because o=
f geographical barriers ?<br><br>regards<br>Ankur</div><div><br></div><div =
class=3D"gmail_quote">On Tue, Apr 12, 2016 at 1:48 PM, Tom King <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ka6sox@gmail.com" target=3D"_blank">ka6sox@g=
mail.com</a>&gt;</span> wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204=
,204,204);border-left-width:1px;border-left-style:solid">do we have meeting=
 minutes posted someplace?<br>
<br>
thanks<br>
<br>
tom<br>
<br>
On Mon, Apr 11, 2016 at 6:43 PM, Philip Balister &lt;<a href=3D"mailto:phil=
ip@balister.org">philip@balister.org</a>&gt;<br>
wrote:<br>
<span><br>
&gt; On 04/11/2016 09:35 PM, Denys Dmytriyenko wrote:<br>
&gt; &gt; On Mon, Apr 11, 2016 at 03:35:21PM -0700, Rudolf J Streif wrote:<=
br>
&gt; &gt;&gt; Hello Everyone:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If you attended OEDAM last Friday in San Diego, I very much h=
ope that<br>
&gt; you enjoyed being here.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The Catamaran Hotel, where we held the meeting, would very mu=
ch<br>
&gt; appreciate your feedback:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <a href=3D"http://www.catamaranresort.com/trip" target=3D"_bl=
ank" rel=3D"noreferrer">www.catamaranresort.com/trip</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I hope you all had a safe trip back home,<br>
&gt; &gt;<br>
&gt; &gt; And huge thanks to Rudi and Jefro for their help in organizing th=
e event!<br>
&gt; &gt;<br>
&gt;<br>
&gt; And an even bigger thanks to everyone that came to the meeting. You ar=
e<br>
&gt; the people that make OpenEmbedded great!<br>
&gt;<br>
&gt; Philip<br>
&gt; --<br>
&gt; _______________________________________________<br>
</span>&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank" rel=3D"noreferrer">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
<div><div class=3D"h5">&gt;<br>
--<br>
_______________________________________________<br>
Openembedded-devel mailing list<br>
<a href=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembedded-d=
evel@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l" target=3D"_blank" rel=3D"noreferrer">http://lists.openembedded.org/mailm=
an/listinfo/openembedded-devel</a><br>
</div></div></blockquote><div class=3D"gmail_extra"><br></div></div>

--001a1134a9163ca52605304139ea--
