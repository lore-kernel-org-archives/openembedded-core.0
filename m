Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id ADFAA75A38
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 09:15:35 +0000 (UTC)
Received: by qgew37 with SMTP id w37so5102047qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 02:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=5dF4KVDQ58lG2r8RgcC/cw8hbbZIKlu+5y2YKIFJtaY=;
	b=NvVmZfYCiUq+v9IS9gjAXHtWHqjZzIZpAM39SXm47Y/XPqgOYEZQBw6bEDaM567irI
	AOSVlNZ/+vsGOztLJoVHTsMcDTfOJ21eBqMX1ZFjFCMT5YhlmMQR/TObrg4HMNinY1mx
	qfe28xaIs1YS9zWYTtUFZRqWXJbl/xWsgyg4F83wbbY5aIqHlNjHWJydUDmZgNnMB43c
	/q6xshDCatCcRQP1fHVlMSCwpoBO/yTIHJTszEMIyF0HarKAqmuXbcXSQHGJu6JtsplH
	drfpfP1kSDbHSjT8hrL8s77OoYE5kmVNN4nl95ISF4sxoqJdIbM2QOVyRII6hOJhs01t
	1OYA==
X-Gm-Message-State: ALoCoQlvpqW9kDCR6XxHluQxj5+ukLrLNlrq/948dI/BQVx94KEPjBpvz8woqdgWWRBbiLDCn05l
MIME-Version: 1.0
X-Received: by 10.140.29.3 with SMTP id a3mr13520462qga.97.1444382135201; Fri,
	09 Oct 2015 02:15:35 -0700 (PDT)
Received: by 10.140.98.55 with HTTP; Fri, 9 Oct 2015 02:15:34 -0700 (PDT)
Received: by 10.140.98.55 with HTTP; Fri, 9 Oct 2015 02:15:34 -0700 (PDT)
Date: Fri, 9 Oct 2015 10:15:34 +0100
Message-ID: <CAP71WjwYnv8WjH=s4gLVwwZV5KDdR=N5uxp9m46L_PesCBoZWA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Too late for mesa upgrade before jethro?
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
X-List-Received-Date: Fri, 09 Oct 2015 09:15:35 -0000
Content-Type: multipart/alternative; boundary=001a113aac2216da850521a86c3e

--001a113aac2216da850521a86c3e
Content-Type: text/plain; charset=UTF-8

Hi,

I am testing right now a patch to upgrade mesa from 10.6.3 to 10.6.9, is it
too late for including it in jethro?

I should be able to send it on Monday.. If it's too late, i will switch to
mesa 11 directly.

Nico

--001a113aac2216da850521a86c3e
Content-Type: text/html; charset=UTF-8

<p dir="ltr">Hi,</p>
<p dir="ltr">I am testing right now a patch to upgrade mesa from 10.6.3 to 10.6.9, is it too late for including it in jethro?</p>
<p dir="ltr">I should be able to send it on Monday.. If it&#39;s too late, i will switch to mesa 11 directly.</p>
<p dir="ltr">Nico</p>

--001a113aac2216da850521a86c3e--
