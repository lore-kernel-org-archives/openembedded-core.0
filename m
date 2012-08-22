Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T4Fjg-0004BK-5E
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 20:33:00 +0200
Received: by daks35 with SMTP id s35so962355dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 11:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=8uuSCJqsaPK+RFUQArnmDefmqyT5at9ab3b6wJkRpRA=;
	b=plW9F/Qwx3ORyXcQuQ+lCpLpQgm39P3IqAEVIJ+zWro/RDrEdjyYEWuXGtnYEdsMNi
	Rr75RWrFYwz+Xjgk7SZV31Lk1iAd7qW2OkENASLm+5wbie53DYJ0Wzn2OItmHIAuOdev
	5oHVx26Be9iecGWzt3zeAtdebPzaUljIT4GP2CtWz5CudMko5BUCLtu+EIKWSzxJ60tM
	/vJTG7YPWtkpTKxVwOAWez3WEK3Y9uTIQv3eLtLkJycdTqE31rYnw9OOujpFE0fnDEQR
	F1zYcQKEO6u+vll883rl/Qt3mSJznNMdInEOhrhdTDVCElmX4rYiTSp9iD2AN2GueCCt
	uc5A==
Received: by 10.66.74.67 with SMTP id r3mr48189329pav.1.1345659654153;
	Wed, 22 Aug 2012 11:20:54 -0700 (PDT)
Received: from [192.168.1.132] (ip68-109-186-98.ph.ph.cox.net. [68.109.186.98])
	by mx.google.com with ESMTPS id rz10sm4179382pbc.32.2012.08.22.11.20.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 11:20:53 -0700 (PDT)
Date: Wed, 22 Aug 2012 11:20:49 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <2E13D0D74D03406FAF576083ED655376@gmail.com>
In-Reply-To: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
X-Mailer: sparrow 1.6.3 (build 1172)
MIME-Version: 1.0
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Wed, 22 Aug 2012 18:33:00 -0000
Content-Type: multipart/alternative; boundary="50352301_2eb141f2_1a3b"

--50352301_2eb141f2_1a3b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, June 15, 2012 at 8:15 AM, Joe MacDonald wrote:
> We've been talking about this on-and-off at Wind River for a while now,
> but it now seems like a reasonable time to bring a proposal to the OE
> community at large. We're thinking about creating a new layer to house
> recipes, etc. for networking packages. I'll try to address what seem to
> be the most immediate questions (certainly the ones we've been thinking
> most about any time I've discussed this with anyone):
> 
Has their been any progress on the creation of this layer?
-- 
Christopher Larson


--50352301_2eb141f2_1a3b
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div><span style=3D=22color: rgb(160, 160, 168); =22>On =46=
riday, June 15, 2012 at 8:15 AM, Joe MacDonald wrote:</span></div>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div style=3D=22color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 13px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; orphans=
: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; wh=
ite-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust=
: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 2=
55); =22>We've been talking about this on-and-off at Wind River for a whi=
le now,</div><div style=3D=22color: rgb(0, 0, 0); font-family: Helvetica;=
 font-size: 13px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: 2; text-ali=
gn: -webkit-auto; text-indent: 0px; text-transform: none; white-space: no=
rmal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webk=
it-text-stroke-width: 0px; background-color: rgb(255, 255, 255); =22>but =
it now seems like a reasonable time to bring a proposal to the OE</div><d=
iv style=3D=22color: rgb(0, 0, 0); font-family: Helvetica; font-size: 13p=
x; font-style: normal; font-variant: normal; font-weight: normal; letter-=
spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-aut=
o; text-indent: 0px; text-transform: none; white-space: normal; widows: 2=
; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-=
width: 0px; background-color: rgb(255, 255, 255); =22>community at large.=
 We're thinking about creating a new layer to house</div><div style=3D=22=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; font-style:=
 normal; font-variant: normal; font-weight: normal; letter-spacing: norma=
l; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent=
: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing=
: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; ba=
ckground-color: rgb(255, 255, 255); =22>recipes, etc. for networking pack=
ages. I'll try to address what seem to</div><div style=3D=22color: rgb(0,=
 0, 0); font-family: Helvetica; font-size: 13px; font-style: normal; font=
-variant: normal; font-weight: normal; letter-spacing: normal; line-heigh=
t: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-t=
ransform: none; white-space: normal; widows: 2; word-spacing: 0px; -webki=
t-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-colo=
r: rgb(255, 255, 255); =22>be the most immediate questions (certainly the=
 ones we've been thinking</div><div style=3D=22color: rgb(0, 0, 0); font-=
family: Helvetica; font-size: 13px; font-style: normal; font-variant: nor=
mal; font-weight: normal; letter-spacing: normal; line-height: normal; or=
phans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: non=
e; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-a=
djust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 2=
55, 255); =22>most about any time I've discussed this with anyone):</div>=
<br class=3D=22Apple-interchange-newline=22></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    Has their been any progress on the creation of this l=
ayer=3F</div><div><div>--&nbsp;</div><div>Christopher Larson</div></div>
            

--50352301_2eb141f2_1a3b--
