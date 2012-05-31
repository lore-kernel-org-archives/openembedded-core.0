Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sa9aP-0004UW-JT
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 19:55:01 +0200
Received: by wibhm14 with SMTP id hm14so1059904wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=ns/gHmAhWmAQHZvRDXRvbIfF6OZUilcMJZy5lelfdjY=;
	b=rRMVD89iMmlhH+atAYriEbS2EJNFt1iw/bfQiBuDSCeGqHFj2AlJO+C4SwZEnINcIm
	wuEP3sMRjwFgZgXYD5JFCccpSGqXI5jIjtGdNzp7C6V9rOrOvqRO5YntaVnlqEeK1GyA
	7aaAnvj/ANIkMBTPqztPZWSbMO74C+3hUWSc3tdwQmLU7bCpqy/w/A+PJF12XNhACvKM
	FxiulLckHSJjY97m6WXj1kE9VaqySstlev/TR3EnQFuXpA8M/BvPg8Gvstlm5VV8NyIX
	0ZLpRblmMFzkkBVHRE3vWnKtHgMkNvLOXR8uMmbHiVXuRaH6rjVaRTndj16oCpbYgf/B
	kNkQ==
Received: by 10.216.199.40 with SMTP id w40mr14094887wen.148.1338486278545;
	Thu, 31 May 2012 10:44:38 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id gc6sm4949578wib.0.2012.05.31.10.44.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 10:44:37 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Thu, 31 May 2012 19:44:41 +0200
Message-Id: <D03C46EA-D51F-40C5-9947-0EA7FAE6DD94@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: [meta-xilinx] WARNING: linux-xilinx: No generic license file exists for: GPL in any provider
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
X-List-Received-Date: Thu, 31 May 2012 17:55:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      While attempting to build linux-xilinx, I get the following =
warning:

WARNING: linux-xilinx: No generic license file exists for: GPL in any =
provider

What should I do to fix this warning?

Best regards,

Elvis Dowson=


