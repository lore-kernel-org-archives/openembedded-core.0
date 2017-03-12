Return-Path: <denys.zagorui@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2360171BD4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Mar 2017 20:02:27 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id v76so48832988ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Mar 2017 13:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=8RwZdcK8zpWs5tFWHV8sINXrC3ya8Bhe27735++/W0w=;
	b=lB1MQ3RnGdov+uuSuoP0EZjIrXpojkyji+Do3ZjW3IaFvLbox32U7V0osP2sqPRlqN
	EtjNkvcociszuZHBqKmd4GnrKiFsejhQeEoJSq+JNSa6eG2MYY1O+jahGmn2SOUgEjpL
	LCxJU1sz0Io9Ewktt5cy2n0i8wjfVfosaqCvzIbk3f1tl3VgbGw2zg/tBcdPeZ0jC2J3
	GfP5+E7dfPUVdznTlWGlunnb0kHxxKr0WBwFetzLQD9FC9kTdRysm/CYscB+7edy7JHl
	3MRc1fhIR8qf+HQXhptOM41e4T1oYX5iGha9ZCiI3fw30A01RUezEGFjIhE4fv+8DWqk
	rzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=8RwZdcK8zpWs5tFWHV8sINXrC3ya8Bhe27735++/W0w=;
	b=aWcN7T4NY6XXDIajWbUts5DrubpKpXtekFwW+zIYIS9YiYmKARwkLMILD4vatSWfE1
	cn0wL80exc/KxiqZ7K6wDli+F4/Jc8lVrYWmd0KI59WCMUuBFsLYspaHinnpkUot2fet
	jvSgiSg0YISExukJEubOImu1F7XvGUa+jXXHgFEXLHksP5eB5GeOCPNiHKhlta4SUtJu
	E+8Owehw5bcLVme5lEWsYmJH6MaQ3tX0ppL7rZfsaDWl1n3ncCEitiUUWeM6FjZbDF60
	YNNBIpnTUT3TV1/iBNyHpCfvA+oq51YdZmN3FQ/r+l/PSsXTYESl79RPUKL+ZmH/G2FQ
	5kiQ==
X-Gm-Message-State: AMke39lWaBrYLme04zkh7m6DhWlq0OsZpBgLQ6Y8k/Z8v/S1beLGG4Dy5X7jQvT1lf58ycmabW+fm8408tKF2w==
X-Received: by 10.129.173.3 with SMTP id l3mr14821003ywh.194.1489348948814;
	Sun, 12 Mar 2017 13:02:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.147.66 with HTTP; Sun, 12 Mar 2017 13:02:28 -0700 (PDT)
Received: by 10.129.147.66 with HTTP; Sun, 12 Mar 2017 13:02:28 -0700 (PDT)
In-Reply-To: <CACJ80St7+4KB+Tm6J=Gqmyc-UVxuky_9Qwu25kFwqJ68=TWKzw@mail.gmail.com>
References: <1489092518-25721-1-git-send-email-denys.zagorui@gmail.com>
	<1489129813.7785.380.camel@intel.com>
	<CACJ80St7+4KB+Tm6J=Gqmyc-UVxuky_9Qwu25kFwqJ68=TWKzw@mail.gmail.com>
From: Denys Zagorui <denys.zagorui@gmail.com>
Date: Sun, 12 Mar 2017 22:02:28 +0200
Message-ID: <CACJ80StSeZbx-GU2NMdY-epRAJL3O2gZ=t30YqubTXaiCSx-DA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gzip: add ptest
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
X-List-Received-Date: Sun, 12 Mar 2017 20:02:29 -0000
Content-Type: multipart/alternative; boundary=f403045f69720a7073054a8e13ee

--f403045f69720a7073054a8e13ee
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Denys Zagorui
GlobalLogic
Kyiv, 03038, Protasov Business Park, N.Grinchenka, 2/1
M +380.67.317.30.93
www.globallogic.com

http://www.globallogic.com/email_disclaimer.txt

11 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2017 12:52 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C "Denys Zagorui" <denys.zagorui@g=
mail.com>
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:

> Hello, thanks for reply.
> I figure out that 'zless' from gzip 1.8 don,t work with 'less' from
> busybox. It's because 'zless' tries to verify 'less' version invoke it wi=
th
> key -V, and 'less' from busybox don't understand this key, so test
> 'help-version' fails. So when i remove version verification from 'zless'
> it's works fine.
> 'zdiff' test also fails, because 'diff' from busybox has another output
> then 'diff' from diffutils package, so patch zdiff test (add version
> verification), if 'diff' from busybox i check one output, if from diffuti=
ls
> another.
>
>
>
> 10 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2017 09:10 =D0=BF=D0=BE=D0=BB=D1=8C=D0=
=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C "Patrick Ohly" <patrick.ohly@=
intel.com>
> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>
>> On Thu, 2017-03-09 at 22:48 +0200, Denys Zagorui wrote:
>> > tests don't work with 'diff' and 'less' utils from busybox
>>
>> I don't think that depending on diff and less is the right solution for
>> that problem, because then enabling testing will change the system that
>> is meant to be tested.
>>
>> For example, suppose that the real system only has busybox and busybox
>> diff needs to work. That version of diff cannot be tested anymore with
>> IMAGE_FEATURES +=3D "ptest-pkgs" because that will pull in gzip-ptest,
>> which then overrides the busybox diff.
>>
>> Perhaps the tests can be fixed to work also with busybox, or the tests
>> can detect busybox and skip the part that depends on real diff and less?
>>
>> --
>> Best Regards, Patrick Ohly
>>
>> The content of this message is my personal opinion only and although
>> I am an employee of Intel, the statements I make here in no way
>> represent Intel's position on the issue, nor am I authorized to speak
>> on behalf of Intel on this matter.
>>
>>
>>
>>

--f403045f69720a7073054a8e13ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div data-smartmail=3D"gmail_signature">Denys Zag=
orui<br>GlobalLogic<br>Kyiv, 03038, Protasov Business Park, N.Grinchenka, 2=
/1<br>M=C2=A0+380.67.317.30.93<br><a href=3D"http://www.globallogic.com">ww=
w.globallogic.com</a><br><br><a href=3D"http://www.globallogic.com/email_di=
sclaimer.txt">http://www.globallogic.com/email_disclaimer.txt</a></div></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">11 =D0=BC=D0=B0=
=D1=80=D1=82=D0=B0 2017 12:52 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=
=B0=D1=82=D0=B5=D0=BB=D1=8C &quot;Denys Zagorui&quot; &lt;<a href=3D"mailto=
:denys.zagorui@gmail.com">denys.zagorui@gmail.com</a>&gt; =D0=BD=D0=B0=D0=
=BF=D0=B8=D1=81=D0=B0=D0=BB:<br type=3D"attribution"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"auto">Hello, thanks for reply.=C2=A0<div dir=3D"auto">=
I figure out that &#39;zless&#39; from gzip 1.8 don,t work with &#39;less&#=
39; from busybox. It&#39;s because &#39;zless&#39; tries to verify &#39;les=
s&#39; version invoke it with key -V, and &#39;less&#39; from busybox don&#=
39;t understand this key, so test &#39;help-version&#39; fails. So when i r=
emove version verification from &#39;zless&#39; it&#39;s works fine.</div><=
div dir=3D"auto">&#39;zdiff&#39; test also fails, because &#39;diff&#39; fr=
om busybox has another output then &#39;diff&#39; from diffutils package, s=
o patch zdiff test (add version verification), if &#39;diff&#39; from busyb=
ox i check one output, if from diffutils another.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><br></div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">10 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2017 09:10 =D0=
=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C &quot=
;Patrick Ohly&quot; &lt;<a href=3D"mailto:patrick.ohly@intel.com" target=3D=
"_blank">patrick.ohly@intel.com</a>&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=BB:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, =
2017-03-09 at 22:48 +0200, Denys Zagorui wrote:<br>
&gt; tests don&#39;t work with &#39;diff&#39; and &#39;less&#39; utils from=
 busybox<br>
<br>
I don&#39;t think that depending on diff and less is the right solution for=
<br>
that problem, because then enabling testing will change the system that<br>
is meant to be tested.<br>
<br>
For example, suppose that the real system only has busybox and busybox<br>
diff needs to work. That version of diff cannot be tested anymore with<br>
IMAGE_FEATURES +=3D &quot;ptest-pkgs&quot; because that will pull in gzip-p=
test,<br>
which then overrides the busybox diff.<br>
<br>
Perhaps the tests can be fixed to work also with busybox, or the tests<br>
can detect busybox and skip the part that depends on real diff and less?<br=
>
<br>
--<br>
Best Regards, Patrick Ohly<br>
<br>
The content of this message is my personal opinion only and although<br>
I am an employee of Intel, the statements I make here in no way<br>
represent Intel&#39;s position on the issue, nor am I authorized to speak<b=
r>
on behalf of Intel on this matter.<br>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--f403045f69720a7073054a8e13ee--
