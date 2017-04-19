Return-Path: <jefro.net@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id C261E71CAA;
	Wed, 19 Apr 2017 21:45:09 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id w50so697483wrc.0;
	Wed, 19 Apr 2017 14:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9j0cNPj6wGPY9jpLI6t6syG5DXahuq2XHmnEU8r6kNM=;
	b=VcrpPDT5nxqiJsQhzNe/+eGKwJm55r6XHDgPr3C5/Pyqb46OcGIJqGWMeegZ659Le+
	dKdjLy6ED+q4yb7JvbMJMwmpN1exUjUGQiyEkeBdmucxt9kK9iDiEg1ABSzcAuEbJQB0
	iq1rsZ9uZud5LiRouX1CLW9Yvc3wo4MJZSbPbyuLUFFHUkqzgsbGf2JhIue8C8nwo++e
	MwQCOVfs+20oqZ9Aaoy4HXDfKrIIjfNhdzqr0arUOOgGl4VkTrviQ31U6K6ibDqv60FX
	iqQwcgLnW+uGx1KjmSnSJTvz9GtAIKH3Eib4pX9FWSO5LHovVYwKpRpkTdVWmmzqSgty
	6u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=9j0cNPj6wGPY9jpLI6t6syG5DXahuq2XHmnEU8r6kNM=;
	b=Dk8eHLA2uiByjnTZLevgutS0JrWnPXRCO/HujuZTtFI6TqzSJ5Lo6E1ORGpYccrZ3F
	TzHnytA1jc8BH7F98GASQfSpb5A/iWdZ5cb7xXekAxdWL790yYsMGoM4cxBYgaBkANfa
	g9bdNjbfGVip2d8N8wfPB2/zB36iOWEgs/lq3JDdU7lNY1QE8AtkAs/F6oOfnAVpC4lE
	dy5ZX2wHdsFVBb1JJgO5HEZJFKnuA4/4d6LMAl84tYcsfdQmbTCOl003SYy7FFdBFah0
	cM78A3/DRqIURsccn1Z2Lirhhp1T2Uw86+Yq2JIbknt3RRfM3keOlyOoWvk5riJb6uDN
	ZIIg==
X-Gm-Message-State: AN3rC/6iyp5cjCLuOGZ74alOWZxH9SVOcZvK59g7Fep1y1okvCfv7jV6
	Fpkc4FRKC7NB8uVF8UamqHWwozWrQg==
X-Received: by 10.223.173.143 with SMTP id w15mr4655349wrc.125.1492638310432; 
	Wed, 19 Apr 2017 14:45:10 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.28.170.196 with HTTP; Wed, 19 Apr 2017 14:44:49 -0700 (PDT)
In-Reply-To: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Wed, 19 Apr 2017 14:44:49 -0700
X-Google-Sender-Auth: m9n2grUSwlLXWr4BupCLsv35zW4
Message-ID: <CA+YB3raLVTqo7m9XRe4S8spJh7Cm7cp+EwU78PpQbSPUW8676g@mail.gmail.com>
To: Sean Hudson <sean_hudson@mentor.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Wed, 19 Apr 2017 21:45:10 -0000
Content-Type: multipart/alternative; boundary=f403045cf65a458f63054d8bf01e

--f403045cf65a458f63054d8bf01e
Content-Type: text/plain; charset=UTF-8

All - please note the time zone carefully when planning to attend.

On Wed, Apr 19, 2017 at 1:48 PM, Sean Hudson <sean_hudson@mentor.com> wrote:

> The board would like to hold a general meeting with all members.  Under
> the new by-laws of the OpenEmbedded organization, we can meet
> electronically.  This will also fulfill the requirement for an annual,
> general meeting.
>
> Planned Date/Time:
> Wednesday, May 3rd, at 8am US-CDT(UTC-06:00)/3pm CET(UTC+01:00)
>
> Wiki page with full details, including teleconference information here:
> http://www.openembedded.org/wiki/2017_General_Meeting
>
> Please take a moment to add your name to the list if you are planning to
> attend and any agenda items you would like to discuss.
>
> --
> Sean
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Jeff Osier-Mixon - Open Source Community Engineer, Intel Corporation

--f403045cf65a458f63054d8bf01e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All - please note the time zone carefully when planning to=
 attend.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Wed, Apr 19, 2017 at 1:48 PM, Sean Hudson <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sean_hudson@mentor.com" target=3D"_blank">sean_hudson@mentor.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The board would like t=
o hold a general meeting with all members.=C2=A0 Under<br>
the new by-laws of the OpenEmbedded organization, we can meet<br>
electronically.=C2=A0 This will also fulfill the requirement for an annual,=
<br>
general meeting.<br>
<br>
Planned Date/Time:<br>
Wednesday, May 3rd, at 8am US-CDT(UTC-06:00)/3pm CET(UTC+01:00)<br>
<br>
Wiki page with full details, including teleconference information here:<br>
<a href=3D"http://www.openembedded.org/wiki/2017_General_Meeting" rel=3D"no=
referrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/2017_Gene=
ral_Meeting</a><br>
<br>
Please take a moment to add your name to the list if you are planning to<br=
>
attend and any agenda items you would like to discuss.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Sean<br>
<br>
</font></span><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-devel mailing list<br>
<a href=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembedded-d=
evel@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>=
mailman/listinfo/openembedded-<wbr>devel</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">Jeff Osier-Mixon =
- Open Source Community Engineer, Intel Corporation</div>
</div>

--f403045cf65a458f63054d8bf01e--
