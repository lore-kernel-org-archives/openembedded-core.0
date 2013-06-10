Return-Path: <sakoman@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFB0621CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:45:42 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id va7so10723102obc.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 15:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=43OikNAEjYhZwrFWSioIDr0Qgz7dnR9B6DknOTkvfXA=;
	b=CySt75iXj5Ib0ylBqKd0KSO3bWxdVBe+gzSKH97bAsqawzfLO/HQdswjTE75MGksCB
	gZKKmjf9bvs1DubTuhT9r4L8GTulhCeaLkZ6urgr2t9NIYJbNUrq+nDKjgNDbYrEjj6a
	OlksOKCBEg3zMXQAd9xc/sCw56Y2M+hv4vGgp4jTw8riTUWy5MygfD19pAW+Qfhfhpyt
	/IrFLXDiJUFrxMXdpy/2Gi04C3b0B4oPPZ5VNl160GSQlbVePSCLrDnjsUc54+5jtfZn
	p/kCDxK5M/wqsRDgxylmD5nC5yTEUr5oERbaPUfV4drA9UrH7pbQ+1EfzP7ez9BPLtVq
	+u/w==
MIME-Version: 1.0
X-Received: by 10.60.134.200 with SMTP id pm8mr9266335oeb.136.1370904343024;
	Mon, 10 Jun 2013 15:45:43 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Mon, 10 Jun 2013 15:45:42 -0700 (PDT)
Date: Mon, 10 Jun 2013 15:45:42 -0700
Message-ID: <CAGDS+nkQ1u=bzhgDGJjMw+U99eazLb_Na51qmVSa2AGUrZM_QQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Sample recipe for qt4e app?
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
X-List-Received-Date: Mon, 10 Jun 2013 22:45:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

The qt-apps folder in oe-core only seems to have recipes for qt4-x11-free apps.

Does anyone have a recipe for a simple qt4e app that they would be
willing to share?

I'm looking to get an idea of just how small a qt4e image can be
without climbing the learning curve of writing a qt app and recipe :-)

Thanks!

Steve

