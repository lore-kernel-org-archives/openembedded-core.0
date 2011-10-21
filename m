Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RHIrg-0002fH-Bd; Fri, 21 Oct 2011 19:26:40 +0200
Received: by ggnj1 with SMTP id j1so2507790ggn.6
	for <multiple recipients>; Fri, 21 Oct 2011 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=EQt0T/XYN05nxc2OhGrF5a/FECYyxIUo7O57EOCcigs=;
	b=iFntgCsrXP4nV+qy95EOXzERt+DvJyFg+jqMZMYWfBcuZ1/2b/yje+ShMbwL3nIK/a
	Qt/KIyXqdpUEdDVl7pA1rPzL7JvTupLNhKzyQHVYdLqGI7Ma6eTJATwcBgDIiPIOKsdY
	wNpPLQvDP6nPd3H1/4ebEXdLqGSuOgayBlp5I=
Received: by 10.68.23.6 with SMTP id i6mr29184531pbf.13.1319217642116; Fri, 21
	Oct 2011 10:20:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 21 Oct 2011 10:20:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2011 10:20:12 -0700
Message-ID: <CAMKF1srCM1QpLmAAr13qbAsD0_PZUx9zLWP==tQMBcy=+ck5Dw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Keeping patch status uptodate in patchwork
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
X-List-Received-Date: Fri, 21 Oct 2011 17:26:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I would like to request the patch submitter to change the status of
patches appropriately particularly case where manual intervention will
be needed

1. When you send pull request the cover letter is not marked accepted
automatically so when pull request is merged please mark it so.
2. When multiple versions of patches V1, V2, V3 are sent then the
versions that don't get applied should be marked as superseded.

It will greatly help in keeping the patchwork clean and layer
maintainers and the data it represents will be lot more relevant.

Thanks for you help

-Khem


