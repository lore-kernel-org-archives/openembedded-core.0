Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id DF0CB724B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 15:33:16 +0000 (UTC)
Received: by padcy3 with SMTP id cy3so22897089pad.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=2G9L67HH73fGT5ayC5vf5wQUWHKLJME5K5osaClrWv8=;
	b=GhTLd8/ojcLwGH+hHzCe+A4tyMR27T8f+wCNYkCWJnr9m5s8qfBm5BBEGcvYj25+K3
	nMhW5V58GXWzrk1ZFwTnYCN6Tfw9ppK0PyJElag0zjEEijmr42Y+5gBhQJtPX6a/oZlL
	aFKuHXmXu04yUz672F6zaAHz8loNv58Oeq/wi2bhuXv+1ZbHax7v2FuG9me8Z71fnqNf
	ihCoce8YQ5/ij9MM9FYHMHLRyRAI5jjI30xjh9JZv5QNneQzVK/KW8irYvNLfpYgcOTG
	38htwXGpBK6PoU6Tmaar6mbNw9dHGkG/81z3f4X6nh9upiu1jTDHoTf3IzgcvNnvRlKe
	3BaA==
X-Received: by 10.68.225.162 with SMTP id rl2mr68099513pbc.117.1427815997642; 
	Tue, 31 Mar 2015 08:33:17 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:bdc8:daf2:1c92:3db7?
	([2601:c:a700:3ba7:bdc8:daf2:1c92:3db7])
	by mx.google.com with ESMTPSA id
	zq6sm13677272pac.11.2015.03.31.08.33.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 08:33:16 -0700 (PDT)
Message-ID: <551ABE39.5050503@gmail.com>
Date: Tue, 31 Mar 2015 08:33:13 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: package update staging
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
X-List-Received-Date: Tue, 31 Mar 2015 15:33:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning all,

now that fido is nearing, what is the best method for staging package 
updates meant for oe-core?

regards,
Armin

