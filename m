Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RJbvv-0004t0-0L; Fri, 28 Oct 2011 04:12:35 +0200
Received: by ggnj1 with SMTP id j1so3217214ggn.6
	for <multiple recipients>; Thu, 27 Oct 2011 19:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0rtlgtbCHlbzW6gVnV8nC4bo4O9H+k0veqeJZjLO3z4=;
	b=vh5anp0iAmhdMzqKdEHDj0DZsX8wymN4j4wMM7ewPonkPzg80T+4qlUyI0xiNHpKWG
	WMlw3hMHjfYwatbBmBUMEynhal/KKB/Aks+BuuwmupFJR0hyiLs3ZsAGxgjlV/j2ukOl
	BjioQ4bmDiduQoyEraM3QSdhOqrg6+WZDZWcw=
MIME-Version: 1.0
Received: by 10.236.124.17 with SMTP id w17mr471511yhh.126.1319767593043; Thu,
	27 Oct 2011 19:06:33 -0700 (PDT)
Received: by 10.236.60.198 with HTTP; Thu, 27 Oct 2011 19:06:32 -0700 (PDT)
In-Reply-To: <20111027210911.GM15391@denix.org>
References: <E1RJWkv-0001RX-LN@happy.bec-systems.com>
	<20111027210911.GM15391@denix.org>
Date: Thu, 27 Oct 2011 22:06:32 -0400
Message-ID: <CAOd_LFw0kBsf-NDpUQ-rUHxYP+v_5Ff3nuSNTUK3QuSrB5_eHw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: "angstrom-distro-devel@linuxtogo.org"
	<angstrom-distro-devel@linuxtogo.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE Changelog for 2011-10-17 to 2011-10-24
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
X-List-Received-Date: Fri, 28 Oct 2011 02:12:35 -0000
Content-Type: multipart/alternative; boundary=20cf300e4fbf91c6e804b0525609

--20cf300e4fbf91c6e804b0525609
Content-Type: text/plain; charset=ISO-8859-1

On Thursday, October 27, 2011, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Oct 27, 2011 at 04:40:53PM -0400, cliff.brake@gmail.com wrote:
>> Changelog for 2011-10-17 to 2011-10-24.  Projects included in this
report:
>
> Cliff,
>
> FYI, I think you have a bug in your scripts, where it misses commits made
on
> Monday, that were not included in the previous ChangeLog and they are
being
> skipped in this one...

Can you give me an example of a commit that got missed and I'll debug?

>
> Also, can you please include meta-ti@yoctoproject.org as the official
mailing
> list for meta-ti/meta-texasinstruments BSP layer. Thanks.
>

Ill look into something like that.  We currently don't have any type of
email field, but something could be added.

Thanks,
Cliff


> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

-- 
=================
http://bec-systems.com

--20cf300e4fbf91c6e804b0525609
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, October 27, 2011, Denys Dmytriyenko &lt;<a href=3D"mai=
lto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>&gt; On Thu, Oct 27,=
 2011 at 04:40:53PM -0400, <a href=3D"mailto:cliff.brake@gmail.com">cliff.b=
rake@gmail.com</a> wrote:<br>
&gt;&gt; Changelog for 2011-10-17 to 2011-10-24. =A0Projects included in th=
is report:<br>&gt;<br>&gt; Cliff,<br>&gt;<br>&gt; FYI, I think you have a b=
ug in your scripts, where it misses commits made on<br>&gt; Monday, that we=
re not included in the previous ChangeLog and they are being<br>
&gt; skipped in this one...<br><br>Can you give me an example of a commit t=
hat got missed and I&#39;ll debug?<br><br>&gt;<br>&gt; Also, can you please=
 include <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a> as the official mailing<br>
&gt; list for meta-ti/meta-texasinstruments BSP layer. Thanks.<br>&gt;<br><=
br>Ill look into something like that. =A0We currently don&#39;t have any ty=
pe of email field, but something could be added.<br><br>Thanks,<br>Cliff<br=
>
<br><br>&gt; --<br>&gt; Denys<br>&gt;<br>&gt; _____________________________=
__________________<br>&gt; Openembedded-devel mailing list<br>&gt; <a href=
=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembedded-devel@li=
sts.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-devel">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedd=
ed-devel</a><br>&gt;<br><br>-- <br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br><a href=3D"http://bec-systems.com" target=3D"_blank">http:/=
/bec-systems.com</a><br>

--20cf300e4fbf91c6e804b0525609--
