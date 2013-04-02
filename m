Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hirst689@gmail.com>) id 1UN5EO-000080-T1
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 19:42:49 +0200
Received: by mail-vc0-f177.google.com with SMTP id ia10so704712vcb.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=rU4pH9Va6l6Eqel1ZHfhx4UdNn8d7KQH6pwnsOJFG2k=;
	b=uTpppgMeR9R7wR//LviRZmJU84B8xYtdspPYjfUJZlMQ7BPbVCi0s5e2DHKJI3DNMK
	hV9/9bqBC862FFp/T1oRJ2VZYs1LEzXus5HWRbwxvRtKryMN7AMSbpv69yKq+r4pq3+5
	36JAy0nHts75YDHOridPbHOfcO0uLYAEJZhNM/T/exYSebNl1Bw2JCdluQvcLOEoe667
	Oe6u2HSoFYS2TntIPTl9y0mZiasHcxlT01vJg5dfbV2C1Y4ZbkA3MUukR0h8nkrbDH8C
	UgM5YGUkd+kj0LDdwkPzKKndwnK2W5GTCFQM5tDsdxIsOoZ/qusWbLLItanZihHOia2u
	oMcg==
MIME-Version: 1.0
X-Received: by 10.52.75.65 with SMTP id a1mr11230185vdw.79.1364923537862; Tue,
	02 Apr 2013 10:25:37 -0700 (PDT)
Received: by 10.59.11.37 with HTTP; Tue, 2 Apr 2013 10:25:37 -0700 (PDT)
In-Reply-To: <CAHu+ux3OLHvwH-0yD0LVfPDTAR-dQgjXpg_Y-DJMTurYsFfv3g@mail.gmail.com>
References: <CAHu+ux3OLHvwH-0yD0LVfPDTAR-dQgjXpg_Y-DJMTurYsFfv3g@mail.gmail.com>
Date: Tue, 2 Apr 2013 13:25:37 -0400
Message-ID: <CAHu+ux02+1hpzqoHw=QwPNa0gdhiuNxsUXnE1Kt9TeEhX0rD0w@mail.gmail.com>
From: David Hirst <hirst689@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Removing qt4-embedded-gles for tisdk-rootfs-image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 17:42:49 -0000
Content-Type: multipart/alternative; boundary=20cf3071cf729eb40b04d96406ec

--20cf3071cf729eb40b04d96406ec
Content-Type: text/plain; charset=ISO-8859-1

How can I remove qt4-embedded-gles from the tisdk-rootfs-image. I do not
feel that I require it, I am looking for a one liner removal but I seem to
be going in circles,
Any pointer would be great


On Tue, Apr 2, 2013 at 10:04 AM, David Hirst <hirst689@gmail.com> wrote:

>
> How can I remove qt40embedded-gles from the tisdk-rootfs-image. I do not
> feel that I require it, I am looking for a one liner removal but I seem to
> be going in circles,
> Any pointer would be great
>
>
> --
> David Hirst
> hirst689@gmail.com
>
>


-- 
David Hirst
hirst689@gmail.com

--20cf3071cf729eb40b04d96406ec
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How can I remove qt4-embedded-gles from the tisdk-rootfs-i=
mage. I=20
do not feel that I require it, I am looking for a one liner removal but I
 seem to be going in circles,<br>
Any pointer would be great</div><div class=3D"gmail_extra"><br><br><div cla=
ss=3D"gmail_quote">On Tue, Apr 2, 2013 at 10:04 AM, David Hirst <span dir=
=3D"ltr">&lt;<a href=3D"mailto:hirst689@gmail.com" target=3D"_blank">hirst6=
89@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><br clear=3D"all"=
></div>How can I remove qt40embedded-gles from the tisdk-rootfs-image. I do=
 not feel that I require it, I am looking for a one liner removal but I see=
m to be going in circles,<br>
</div>
Any pointer would be great<span class=3D"HOEnZb"><font color=3D"#888888"><b=
r><br><br><div><div><div>-- <br>David Hirst<br><a href=3D"mailto:hirst689@g=
mail.com" target=3D"_blank">hirst689@gmail.com</a><br><img alt=3D""><br>
</div></div></div></font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br>David Hirst<br><a href=
=3D"mailto:hirst689@gmail.com" target=3D"_blank">hirst689@gmail.com</a><br>=
<img alt=3D""><br>
</div>

--20cf3071cf729eb40b04d96406ec--
