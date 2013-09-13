Return-Path: <jc@vtkloud.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 34EE160EE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 23:12:41 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id ex4so1457024wid.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 16:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=fiwY8ipopWgc71krWcffr9I0Oj3UOb/E4Sf8UnFB0Qc=;
	b=Xe5wsoLQeHU3eN4LUjCAyf2a8xt/QvlS6GxixzkvDwbXqZBcRZs68qDL2ZJtN8TyNZ
	MZoMKREknHPUFJjFiNvfijicUjHTxUZpbLuhv/tXFSwkR+FVmiHPVhnfiRodPDMHPyhU
	yL9uVC0GPekRLCvlwY/Ni5NFYxltnatu2aZniRTl7PfzQAO0a6TeKEVYqaAARRXQ+LeU
	OIfIevfBjn2oTVzJ27tYMwm87jWYVso2w/ZxTX8lpEU2jgQq5Xy1EUGOfFCRimeSzOKv
	XKuK7jWoV1U03pEhQbVWyXk5p79muoOZUXO1MNkrwbIvAasuiC2YuaImGzHrAiYW8U+J
	B5xg==
X-Gm-Message-State: ALoCoQn+lekXfQSXUEO8eMdm8hkdTjiJJkxGyceFIIpqkzxMzgz1lsDCQw227+35hjwVSY98VI2a
X-Received: by 10.180.20.42 with SMTP id k10mr4686096wie.0.1379113962522;
	Fri, 13 Sep 2013 16:12:42 -0700 (PDT)
Received: from [192.168.0.50] (aig34-1-88-167-231-94.fbx.proxad.net.
	[88.167.231.94])
	by mx.google.com with ESMTPSA id e5sm6580387wiy.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Sep 2013 16:12:39 -0700 (PDT)
Message-ID: <52339BE5.8000804@vtkloud.com>
Date: Sat, 14 Sep 2013 01:12:37 +0200
From: JC <jc@vtkloud.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: lib ao ?
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
X-List-Received-Date: Fri, 13 Sep 2013 23:12:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I cannot find a trace of libao. Is this present somewhere in some 
openembedded-* repo I would have missed ? I could not find it in 
layers.openembedded.org

Thanks for your help,
Jay

