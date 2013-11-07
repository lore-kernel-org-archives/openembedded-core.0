Return-Path: <seth.boll@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 591E36D1FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 17:55:08 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id l6so1390779oag.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=tn5coYykxVyvdg8ah+qLPVQaPxbQxkIVvu4ukmzIj/8=;
	b=W1rN6Zn8MAkGOm3nlv/RK31FQ6KCyNRLfBLQliujUjINVb9twtGkHM5OSOY1cUUymC
	dAvfb5O1ZBfQWcg+XhHYAvwIwWqhAxZXxrcShlnlBW5Yji4UErOZ2etCqa001CylbziM
	tvt4VLGwVzXtvOm2Y5t/KcSfzC/hsT+bQmoSik3EQAttMPlJOCFAGIUiF743pQA9gct6
	YHag37JWK5M+q6yX7+y42fHiH1BzuqN9jj8pP3V7HHV0Vp9JmwJCCjozYUhG4uo9ZNsE
	R3ue3gMxuTvAY6B0vZNRv6S0Xz734zZSBs23E7YtNoAds6CbJ/FjXZ63eLrf1CucNmho
	zaww==
MIME-Version: 1.0
X-Received: by 10.60.44.239 with SMTP id h15mr7659717oem.22.1383846910099;
	Thu, 07 Nov 2013 09:55:10 -0800 (PST)
Received: by 10.60.94.241 with HTTP; Thu, 7 Nov 2013 09:55:10 -0800 (PST)
Date: Thu, 7 Nov 2013 11:55:10 -0600
Message-ID: <CA+JN8xOQvNk_DFG+Zqk_Z6XVcaRA2MBAS9_y1emuZzAwQ24m_A@mail.gmail.com>
From: Seth Bollinger <seth.boll@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: libxml2 python module
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
X-List-Received-Date: Thu, 07 Nov 2013 17:55:09 -0000
Content-Type: multipart/alternative; boundary=001a11331e1a800dda04ea99f743

--001a11331e1a800dda04ea99f743
Content-Type: text/plain; charset=ISO-8859-1

Hello All,

I've been trying to build a non-native version of the libxml2 python module
and am having nothing but trouble.

I've tried setting EXTRA_OECONF --with-python, but it doesn't appear to be
having much affect.

I'm currently trying to hack together using python manually to build the
install, but this feels like I'm moving in the wrong direction.

Can anyone offer any guidance please?

Thanks,

Seth

--001a11331e1a800dda04ea99f743
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>I&#39;ve been trying to buil=
d a non-native version of the libxml2 python module and am having nothing b=
ut trouble.</div><div><br></div><div>I&#39;ve tried setting=A0EXTRA_OECONF =
--with-python, but it doesn&#39;t appear to be having much affect.</div>
<div><br></div><div>I&#39;m currently trying to hack together using python =
manually to build the install, but this feels like I&#39;m moving in the wr=
ong direction.</div><div><br></div><div>Can anyone offer any guidance pleas=
e?<br>
</div><div><br></div><div>Thanks,</div><div><br></div><div>Seth</div></div>

--001a11331e1a800dda04ea99f743--
