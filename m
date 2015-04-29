Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id B6E6F73C8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 18:24:52 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so35491038pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=ssLgyMgXvRnOLPYy2B0bQlO51ZvQPVn7uH8csr/yBmI=;
	b=ylrR6fu60xw5mS1BFN2DtURXMGWat37MQB8ZGgXh58LLvTp9gnvxo9puNwYn9x5Ktl
	cS3WTW5oQnFb9vDFuWr5lY0F4SLb6urDY4e1R3kXWq0eOoeDHqgB/KQHdZEPPwYo+d1o
	jq8Kjo7UOYP9OHIB21GspR9tD576y3lXYPTVku1lYYuGER9IRYI2d1SAb4NyW27DIm3A
	RSlkC+zDT98FU2b5TYl9JM2sLOMn1z82uKiy+CssRpKKx+LQP2GOawpWmkVSCTW3x0CV
	dIfe4Tlwk21dTyD/46P7+o9ROB8EY6Tiwf2XZMqxrjGsKQMMmYDd6CxK6SlQO6MewwGX
	E7oA==
X-Received: by 10.66.142.137 with SMTP id rw9mr758659pab.56.1430331893491;
	Wed, 29 Apr 2015 11:24:53 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:1c1c:3d71:9bce:9de?
	([2601:c:a700:3ba7:1c1c:3d71:9bce:9de])
	by mx.google.com with ESMTPSA id
	su5sm26019304pbc.38.2015.04.29.11.24.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Apr 2015 11:24:52 -0700 (PDT)
Message-ID: <554121F2.1050004@gmail.com>
Date: Wed, 29 Apr 2015 11:24:50 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: GCC 5.0
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
X-List-Received-Date: Wed, 29 Apr 2015 18:24:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

What is the latest process to include building GCC 5.x? the old contib 
branch seems to be dead and I have not been following this topic very well.

regards,
Armin

