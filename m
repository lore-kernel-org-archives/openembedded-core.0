Received: from mail-pd0-f170.google.com ([209.85.192.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1USIHD-0002jQ-68
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 04:39:15 +0200
Received: by mail-pd0-f170.google.com with SMTP id 10so610259pdi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 19:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=iQiBqWeoeNVB5vhB2wIjRyCOpIxjK884xb3Zjm5TTAk=;
	b=dC1k+0ELasg2k5d6Yvb8BTq7Ia9yd80QHd6/0dkaQX8uN96cnj75we4h2p3h3HvOGI
	ka79gIZ0VYlGfW3XTohjlXOoPwoHJ1GDOJUBzEg64fmni+lz8i6cuePOnJTh511y5BS6
	I5Mts1nutl83/yENW3gbol0d4BsDIWr9CycnmYbQVd/HVP4/RI4g9fbdAF9SXMUnGBLM
	SY2AceCqC9PmbYL2RN1swq748IWbhdUWzJrEjsF1y+WtG+fxdPUtDNnsWtgw+0WRH+4E
	jNAzfN/n4aKe6q9ljq8b9G6/K4P4gLJjhSoZ9umN2FCP6LUbU0S7WDM4xXYwMBp06SqD
	gqdQ==
X-Received: by 10.66.8.69 with SMTP id p5mr6351911paa.57.1366165303418;
	Tue, 16 Apr 2013 19:21:43 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id to7sm5022930pab.0.2013.04.16.19.21.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 19:21:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6632530.D4BqdoBVLR@yiqingliang-pc>
Date: Tue, 16 Apr 2013 19:21:44 -0700
Message-Id: <DCA24C19-B5CC-4C7C-8D3F-058C2B269B9F@gmail.com>
References: <4914614.5LoTVAGS7p@yiqingliang-pc>
	<516D0783.8040608@communistcode.co.uk>
	<6632530.D4BqdoBVLR@yiqingliang-pc>
To: Yi Qingliang <niqingliang2003@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc compile error
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
X-List-Received-Date: Wed, 17 Apr 2013 02:39:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Apr 16, 2013, at 6:56 PM, Yi Qingliang <niqingliang2003@gmail.com> wrote:

> when the oe will upgrade gcc to 4.8 or 4.7.3?

after 1.4 release, i.e. master which will become 1.5 in coming fall.


