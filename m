Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 945826017E;
	Mon,  8 Dec 2014 07:53:12 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id z10so4694071pdj.14
	for <multiple recipients>; Sun, 07 Dec 2014 23:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=Et71YqvZyHGFeq+Hr927Cpx53zdQcO9kFaI2pOZi0B0=;
	b=heYGa1mHm6RQum7Cxy4sbFWCXb+PN6RhATsIFqm7Y/3/cQfQ15DZuP4urvn81YFjT5
	Oi7E3lBvuue4OushEALEaNLgBvFYLFgO1PaoQfnw/kQeU15FRZIqDSb6ozGZm6BGg9pm
	KHhLkYyQH1OvXwZyoC4DdLpqShb7DN6ktXoAgJz4dnJGaYDem6vhSDQ0HfChjVNJZEr9
	SuBW211lPG2+4UB4AxyaB3FWAlEsD1unZXEpKm4Vjp9OiAJE9IsswycKPiyCce4GiaDe
	ncMFV5Jpt+3inUA6MtF8N+0DRRBeuxX3SRagWyOYjnme6HKHTglQz5yBnRzKKlqi2y/b
	kO1A==
X-Received: by 10.70.65.66 with SMTP id v2mr18219695pds.37.1418025193192;
	Sun, 07 Dec 2014 23:53:13 -0800 (PST)
Received: from [192.168.1.133] (cpe-66-91-105-196.hawaii.res.rr.com.
	[66.91.105.196]) by mx.google.com with ESMTPSA id
	py1sm15660390pdb.74.2014.12.07.23.53.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Dec 2014 23:53:12 -0800 (PST)
Message-ID: <548558E5.7030706@gmail.com>
Date: Sun, 07 Dec 2014 23:53:09 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: meta globus (grid toolkit)
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
X-List-Received-Date: Mon, 08 Dec 2014 07:53:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Is anyone working on adding Globus toolkit as a meta layer? I started on 
one and have several packages building. It is a bit rough.

It is located at https://github.com/akuster/meta-globus

regards,
Armin

