Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZiyl-0005Ud-M5
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 15:30:23 +0200
Received: by eaal1 with SMTP id l1so1745506eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MDwHYkjsB0bEUD8HSlWq94iUuvmh48NoLXPdJKF48FY=;
	b=YnoeJxc26CboWrcLUWTIf7dW1DjU7FabOcwxCu0CKcoRMO+JTmtdOd9m6DboQ0hUJM
	8VIsLDT9rxPF0z6PwB1fp6Mpbex5NFJpDM+srb0w2QKXS8poHeLFKOXdrzvNMcMh9CWl
	KBj8SHzBhkllfpaLc2hn8g9uKwP36v66K6st8sTnTNuZeiN9THx6+fe/396l4xeXz9/C
	qBautH/PY9gIgsYorkX/as4vHn2/pWX++9eY3Mwm87GbGDi4o7rgtOl3QYvlUX5OEBGC
	SnKmQjocPGD9S8y7nuR8WkTii84tp0GCfoJ021AMcwppa16uFyYLbBQgy2DrKmXeieH4
	pQLw==
MIME-Version: 1.0
Received: by 10.14.188.140 with SMTP id a12mr5531979een.25.1338384005067; Wed,
	30 May 2012 06:20:05 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Wed, 30 May 2012 06:20:05 -0700 (PDT)
In-Reply-To: <CAJTo0LYmnmcX=qNz=uA-bQLRkS2+AXLrwbrEX+3Dv4wGx9QG0w@mail.gmail.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<e50f2bf59b64accf580fc2df96e1fbc9eb6cfb98.1338323483.git.ross.burton@intel.com>
	<CAMKF1so_=OjU2OcoVYO=B5g2KzYAgtY4aA4gNr_cv09YFcxbeQ@mail.gmail.com>
	<CAJTo0LYe1y0r-VhGqsZ1ejfhN39Awd61Zq6yGk0Bf=VN+zJrHA@mail.gmail.com>
	<CAMKF1sp2kUL-w==UiXT4SmykAcoN5j93vFxSF2-EmBs9mjWcjA@mail.gmail.com>
	<CAJTo0LYmnmcX=qNz=uA-bQLRkS2+AXLrwbrEX+3Dv4wGx9QG0w@mail.gmail.com>
Date: Wed, 30 May 2012 06:20:05 -0700
Message-ID: <CAMKF1spimcD7atit23hjHsvJD4uZy5-JaK38TqBM0n0cJbdKBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] connman: just give xuser the extra rights it needs
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
X-List-Received-Date: Wed, 30 May 2012 13:30:23 -0000
Content-Type: multipart/alternative; boundary=bcaec52be54331f44704c140cfd0

--bcaec52be54331f44704c140cfd0
Content-Type: text/plain; charset=UTF-8

On Wednesday, May 30, 2012, Burton, Ross wrote:

> On 30 May 2012 14:00, Khem Raj <raj.khem@gmail.com <javascript:;>> wrote:
> > You could have created a new patch and deleted the old then for clarity
>
> The filename is sensible, the comment was entirely rewritten, as was
> the actual delta of the patch.  I don't see how this could be any more
> clear really.
>
>
Not an issue. usually editing same patch gives the impression of update not
rewrite
But you explained it


> Ross
>
> _______________________________________________
> Openembedded-core mailing lists
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec52be54331f44704c140cfd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 30, 2012, Burton, Ross  wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On 30 May 2012 14:00, Khem Raj &lt;<a href=3D"javascript:;"=
 onclick=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.kh=
em@gmail.com</a>&gt; wrote:<br>

&gt; You could have created a new patch and deleted the old then for clarit=
y<br>
<br>
The filename is sensible, the comment was entirely rewritten, as was<br>
the actual delta of the patch. =C2=A0I don&#39;t see how this could be any =
more<br>
clear really.<br>
<br></blockquote><div><br></div><div>Not an issue. usually editing same pat=
ch gives the impression of update not rewrite</div><div>But you explained i=
t<span></span></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

Ross<br>
<br>
_______________________________________________<br>
Openembedded-core mailing lists=C2=A0<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote>

--bcaec52be54331f44704c140cfd0--
