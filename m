Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SXCM7-0004on-97
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 16:16:03 +0200
Received: by eekd49 with SMTP id d49so2473730eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 07:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=kzsm5kvx+FF1k1A0Nq0XRuxgHcI7pt/5Uta2naAN9DY=;
	b=VuVZPOEqaiOE8sUtjSQ2CpkvbKvyuGTxbgGTAB3n5EU0JKy6Bjk7+t7IGQwKf8BXgd
	0pjXdjz0kXMywi3EqUC8MivFCKdjrMl3wPOK/oVIV6rzoe6T+ohTUBTfE6q1BE+bNRHB
	inQUs9X+i7GllZM1J9C9xD8yN/coS38tqn+QneXNlEcSHNe4M3bLMcyog9XBliCIu09W
	dqkOFedndiD2bNxggN9SQVDDN+VIytnokz0auI+MMhRzjmAock7jNaUYANK24WM7QYfw
	908gPpXRTdldr0sjTldApVAvmup8GB8S0qW2HKttbIOYDxJq78rAWXHK0fNlcffsLgHK
	Nlug==
Received: by 10.213.33.75 with SMTP id g11mr1304925ebd.146.1337781953189;
	Wed, 23 May 2012 07:05:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n52sm123629778eeh.9.2012.05.23.07.05.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 07:05:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
Date: Wed, 23 May 2012 16:05:50 +0200
Message-Id: <3B64436D-65E8-4090-99D7-91B3D4FFC42D@dominion.thruhere.net>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnkfiHX8y2z2/AOKuRjWSV5PyB/H/YC3as4XSLHaTLdxeFcTm8eCpQtNy6kVsGrWjo7dy+a
Subject: Re: [PATCH 00/19] Package updates
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
X-List-Received-Date: Wed, 23 May 2012 14:16:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mei 2012, om 15:10 heeft Laurentiu Palcu het volgende geschreven:

> The updates in this patchset are mainly related to graphics =
functionality area.

How were those tested?

> The following changes since commit =
33c4bf2096effc850720009564e3d1adbda24452:
>=20
>  fetch2: Also exclude urls containing wildcards from checksumming for =
now (2012-05-22 12:18:53 +0100)

That commit doesn't exist in oe-core

> are available in the git repository at:
>=20
>  git://git.yoctoproject.org/poky-contrib lpalcu/updates
>  http://git.yoctoproject.org/cgit.cgi//log/?h=3Dlpalcu/updates

And that branch fails to merge into oe-core=


