Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id A42486010B;
	Tue, 17 Nov 2015 15:05:55 +0000 (UTC)
Received: by igvi2 with SMTP id i2so98475172igv.0;
	Tue, 17 Nov 2015 07:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=XQlFyuTSO1JcmNanLPMnP+6PMLZHjGz0INEYZ6PbDLE=;
	b=dYoLdl6O/cJloRp0Apc6yOH/fjEqD/IBEKLZjcJKdx+LaEHk2tMnvZmgBA+9rsl0nJ
	tHTk8tuzd4k+8lzeru9b++2IknRzkoXiq9bLhrQX/tos6Jdb+Ux9vXOvWcfdwn5kaxkE
	v0XRRmXYPcQQ1Rdt7c5ioQyzpNsdFBDosQQKp+cIMlUKpMTNTq+ILU4JkBk7hoZVEV6S
	S81UVel978bkDuNAsHbvXHOr08K2Aod2RQr3YDEs86kd593o6n1qfz+KZuXOSs6uS/I4
	5fW0Nx2SKEYPVAOQagsHf46aDegD7HVS7GzCRVk93wlmU3khiliyk9J+VwjN6M5+xtgc
	IQ2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=XQlFyuTSO1JcmNanLPMnP+6PMLZHjGz0INEYZ6PbDLE=;
	b=hj5IhTt1LBAy6Rlgwna7JvVOFShieViVfjKLnjPdA3KsMLgA+LnqQ9U5wS9E8ChzFM
	T4xQ51yRcElm6gWo9FSiF7ODqDjegPO6ngB8g8M0pdSuIeuK5QzLWicOhJNTpROeqXzM
	pLT12AsUVKVWyaKCxWcJSIdWFH2gQdUTOYutHvwAgLuRVfA5KcY9vz/2dsM5qkcl8EpW
	bZR2WUwYy3oRVAoS83RjetpRuQ4mX6s9bp58nsqY3Ob7U557q08zTGp+a6rxf5oydm0K
	MD1vXANk1gr36aDP1E81sykplEvxGcPb8kJXWlkQhhSN3vxL9skylHgC8dR5Xg8lPNoF
	filA==
X-Received: by 10.50.78.138 with SMTP id b10mr2553637igx.10.1447772756632;
	Tue, 17 Nov 2015 07:05:56 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Tue, 17 Nov 2015 07:05:05 -0800 (PST)
In-Reply-To: <564B413F.8040500@balister.org>
References: <mailman.0.1447754882.1996.openemebdded-architecture@lists.openembedded.org>
	<564B413F.8040500@balister.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 17 Nov 2015 08:05:05 -0700
X-Google-Sender-Auth: zVHz457i3ttB3God-eULyyj9etI
Message-ID: <CABcZAN=+gXP731wev9X+TCDJsu=gJ6Ut6q5_Bjo6SoZj83RVdw@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Welcome to the "Openemebdded-architecture" mailing list
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
X-List-Received-Date: Tue, 17 Nov 2015 15:05:57 -0000
Content-Type: multipart/alternative; boundary=089e01229eb2dfed6b0524bddca2

--089e01229eb2dfed6b0524bddca2
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 17, 2015 at 8:01 AM, Philip Balister <philip@balister.org>
wrote:

> During OEDEM in Dublin we talked about creating a list for high level
> architecture discussions about the OpenEmbedded Build System.
>
> Bring your big ideas to the list, discuss them, and bring the resources
> to implement them.
>
> We did discuss list proliferation, filtering patches, etc and still
> decided the best solution was a new list.
>
> Philip
>
>
> -------- Forwarded Message --------
> Subject: Welcome to the "Openemebdded-architecture" mailing list
>

Typo. Openemebdded :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01229eb2dfed6b0524bddca2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Nov 17, 2015 at 8:01 AM, Philip Balister <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><div id=3D":a4" class=3D"" style=3D=
"overflow:hidden">During OEDEM in Dublin we talked about creating a list fo=
r high level<br>
architecture discussions about the OpenEmbedded Build System.<br>
<br>
Bring your big ideas to the list, discuss them, and bring the resources<br>
to implement them.<br>
<br>
We did discuss list proliferation, filtering patches, etc and still<br>
decided the best solution was a new list.<br>
<br>
Philip<br>
<br>
<br>
-------- Forwarded Message --------<br>
Subject: Welcome to the &quot;Openemebdded-architecture&quot; mailing list<=
/div></blockquote></div><br>Typo.=C2=A0<span style=3D"font-size:12.8px">Ope=
nemebdded :)<br></span>-- <br><div class=3D"gmail_signature">Christopher La=
rson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Open=
Zaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</=
div>
</div></div>

--089e01229eb2dfed6b0524bddca2--
