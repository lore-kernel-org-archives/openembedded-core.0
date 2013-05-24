Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4F54A60825;
	Fri, 24 May 2013 03:53:00 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx1so3795128pab.13
	for <multiple recipients>; Thu, 23 May 2013 20:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version:x-mailer;
	bh=EtBtKPipeuXvJVG2RDCAL1J2fO6mKq1w65kufOh5lxM=;
	b=Fc8UYlNR3YbA3FsbWcNRfCt7bP8JTrWdO+D1lG1OMlMkC2A1gjrIPWl6GAvQSzzQ6M
	o721SODY/8P3SaPNG9OVhcvfbt7+TFQ33XGD813AjZ8X3pa1ncKDDKy2DzHwfmNTQY1Y
	ep5H92HmJan57ITZVBRYRFXgkHgXMl7wU/kb4ply/NSmexXO85HFNnBTvtDKFntCakUR
	TOJNjIIv+Jap6gSen5p8imxul/eCxKbcj7iC2h2zNoM0284oYXTdFlyT55heEtXpCScX
	iSJJo6sb/7NMgMf9mzHdRkQJMMSfsKP2Xy1nAzb4CtUITCXzNlw+r926WeXOx+Jv5uzT
	i6dQ==
X-Received: by 10.68.253.230 with SMTP id ad6mr15557593pbd.182.1369367581309; 
	Thu, 23 May 2013 20:53:01 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.106.101])
	by mx.google.com with ESMTPSA id
	ue8sm15522574pac.14.2013.05.23.20.52.57 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 20:53:00 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Fri, 24 May 2013 07:52:53 +0400
Message-Id: <F001008B-B137-40CA-B102-2FFBC49C2302@gmail.com>
To: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>, 
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	meta-xilinx Mailing List <meta-xilinx@yoctoproject.org>
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
X-Mailer: Apple Mail (2.1498)
Cc: Nathan Rossi <nrossi@xilinx.com>, Sipke Vriend <sipke.vriend@xilinx.com>
Subject: meta-xilinx moved to meta-xilinx-community
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
X-List-Received-Date: Fri, 24 May 2013 03:53:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      The existing meta-xilinx repo has moved to meta-xilinx-community

http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx-community/

This layer will contain community support for the Xilinx platforms, =
including legacy boards (ML507) and other soft-processor architectures.

This paves the way for an officially supported meta-xilinx layer, the =
details of which will be officially announced by Xilinx.

Best regards,

Elvis Dowson=

