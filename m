Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SMbps-00064Z-Vr
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 11:15:01 +0200
Received: by lbjn8 with SMTP id n8so305862lbj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 02:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=stVPC+0z/PdUT0nFK482TRf+YiRleudgC46ug+Q8H2c=;
	b=Q52zLsjkFoke+9kpIcZoY1JhFOp6Yb+QPVYEmgIt4jkQYP4XSA/LaGEjuzYMTNM2iR
	VlJvCSUlTDq30w/ymzZTLp2CyyH7L4EtPruyfc8e0ZyfJ8SpbZ9KNv0y6THhEk7wEdWn
	nlhpJO4M14fBCI2OFvdmz2t8cs5OMBJEvUGer04DqtM1PX9VC09bwm13gq52Ac8AKMVK
	+pyz5501IFtrFoaM+2U4rR36+rVFZcdiJSbNKXzyCE8ezMusyxxY3UcsmoprMmZnFoXf
	R4MahLQlwupl0k+fJiEw8v66BtTOrI56XVOf9lbEheBDlBlcRlmPIdkmfB1TT0wik5ia
	fjDA==
Received: by 10.152.162.72 with SMTP id xy8mr4941477lab.28.1335258326654;
	Tue, 24 Apr 2012 02:05:26 -0700 (PDT)
Received: from [192.168.0.117] ([84.49.231.147])
	by mx.google.com with ESMTPS id ph8sm18408219lab.15.2012.04.24.02.05.25
	(version=SSLv3 cipher=OTHER); Tue, 24 Apr 2012 02:05:25 -0700 (PDT)
Message-ID: <4F971540.50208@gmail.com>
Date: Tue, 24 Apr 2012 23:04:00 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335245655.git.xiaofeng.yan@windriver.com>
	<fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
	<4F9714DD.6070608@gmail.com>
In-Reply-To: <4F9714DD.6070608@gmail.com>
Subject: Re: Error compiling Boost with Python support on 64-bit host for 32-bit target.
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
X-List-Received-Date: Tue, 24 Apr 2012 09:15:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ouch. Didn't mean to make this a part of another thread. Sorry about that.


